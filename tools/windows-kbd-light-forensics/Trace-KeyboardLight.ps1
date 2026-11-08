<#
.SYNOPSIS
    Read-only forensic scan that traces how a keyboard lighting driver or
    vendor lighting suite was removed from this Windows machine.

.DESCRIPTION
    Checks the registry, Windows event logs, setupapi.dev.log, the driver
    store, and local AI-agent session traces (Grok workspace + PowerShell
    history), then writes a Markdown report to the Desktop.

    This script makes NO changes to the system. Every command is a read.

    Run from an elevated PowerShell for full visibility:

        powershell -ExecutionPolicy Bypass -File .\Trace-KeyboardLight.ps1

.PARAMETER Days
    How far back to scan event logs. Default: 30.

.PARAMETER OutDir
    Directory for the report. Default: the current user's Desktop.
#>
[CmdletBinding()]
param(
    [int]$Days = 30,
    [string]$OutDir = [Environment]::GetFolderPath('Desktop')
)

$ErrorActionPreference = 'Continue'
$since      = (Get-Date).AddDays(-$Days)
$stamp      = Get-Date -Format 'yyyyMMdd-HHmmss'
$reportPath = Join-Path $OutDir "kbd-light-report-$stamp.md"

$script:Sections = New-Object 'System.Collections.Generic.List[string]'
$script:Findings = New-Object 'System.Collections.Generic.List[string]'

function Add-Line ([string]$Text = '') { $script:Sections.Add($Text) }

function Add-Heading ([string]$Text) { Add-Line ''; Add-Line "## $Text"; Add-Line '' }

function Add-Code ($Object) {
    Add-Line '```'
    if ($null -ne $Object) {
        $text = ($Object | Out-String -Width 220).TrimEnd()
        if ($text) { $text -split "`r?`n" | ForEach-Object { Add-Line $_ } }
        else       { Add-Line '(nothing)' }
    } else { Add-Line '(nothing)' }
    Add-Line '```'
}

function Add-Finding ([string]$Severity, [string]$Text) {
    $script:Findings.Add("- **[$Severity]** $Text")
    Add-Line "> **[$Severity]** $Text"
}

function Get-EventsSafe ([hashtable]$Filter, [int]$Max = 300) {
    try { Get-WinEvent -FilterHashtable $Filter -MaxEvents $Max -ErrorAction Stop }
    catch { @() }
}

function Format-Events ($Events) {
    $Events | ForEach-Object {
        $msg = ($_.Message -replace '\s+', ' ')
        if ($msg.Length -gt 220) { $msg = $msg.Substring(0, 220) + '...' }
        '{0:yyyy-MM-dd HH:mm:ss}  [{1}]  {2}' -f $_.TimeCreated, $_.Id, $msg
    }
}

# Keyword nets used throughout. Broad on purpose: false positives in the raw
# sections are fine, the findings list is the curated part.
$vendorRx = 'backlight|keyboard|kbd|rgb|aura|lighting|armoury|armory|vantage|legion|alienware|awcc|mystic|steelseries|omen|predator|nitro|razer|synapse|logitech|lghub|g hub|icue|corsair|signalrgb|openrgb|winring0|eneio|enetechio|ite8'
$suiteRx  = 'armoury|armory crate|asus system control|aura sync|vantage|legion toolkit|alienware|command center|msi center|dragon center|steelseries|omen gaming|predatorsense|nitrosense|razer synapse|g hub|lghub|icue|corsair|signalrgb|openrgb'
$cmdRx    = 'pnputil|winring0|uninstall|remove-item|delete-driver|delete\s*driver|msiexec(\.exe)?\s+/x|disable-pnpdevice|sc(\.exe)?\s+(config|delete|stop)|driverquery|devcon'

Write-Host "Scanning (window: last $Days days). Read-only - no changes are made." -ForegroundColor Cyan

# --- 1. System -------------------------------------------------------------
Add-Heading '1. System'
$cs = Get-CimInstance Win32_ComputerSystem  -ErrorAction SilentlyContinue
$os = Get-CimInstance Win32_OperatingSystem -ErrorAction SilentlyContinue
$identity = [Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()
$isAdmin  = $identity.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

Add-Code @(
    "Manufacturer : $($cs.Manufacturer)"
    "Model        : $($cs.Model)"
    "OS           : $($os.Caption) (build $($os.BuildNumber))"
    "Elevated     : $isAdmin"
)
if (-not $isAdmin) {
    Add-Finding 'WARN' 'Not running elevated - Defender/PowerShell logs and some registry hives may be incomplete. Re-run as Administrator for a full picture.'
}

# Map the manufacturer to the lighting stack this machine is expected to have,
# so "suite not installed" below can be judged against hardware reality.
$expectedStack = switch -Regex ($cs.Manufacturer) {
    'ASUS'           { 'ASUS: Armoury Crate + ASUS System Control Interface driver (keyboard backlight via ATK/asusgio kernel drivers)' }
    'LENOVO'         { 'Lenovo: Lenovo Vantage (or Legion Toolkit) + ITE lighting driver (ITE829x) on Legion models' }
    'Dell|Alienware' { 'Dell/Alienware: Alienware Command Center (AWCC) + LightFX services' }
    'HP|Hewlett'     { 'HP: OMEN Gaming Hub for OMEN/Victus keyboards' }
    'Micro-Star|MSI' { 'MSI: MSI Center (Mystic Light) + SteelSeries Engine on SteelSeries keyboards' }
    'Acer'           { 'Acer: PredatorSense / NitroSense' }
    'Razer'          { 'Razer: Razer Synapse' }
    default          { 'Unknown vendor - lighting may be firmware-only (Fn hotkeys) or via OpenRGB/SignalRGB (both depend on a WinRing0-class driver)' }
}
Add-Line "Expected lighting stack for this hardware: $expectedStack"

# --- 2. Devices present right now ------------------------------------------
Add-Heading '2. Keyboard / HID devices currently visible'
$kbd = @(Get-PnpDevice -Class Keyboard -ErrorAction SilentlyContinue) +
       @(Get-PnpDevice -Class HIDClass -ErrorAction SilentlyContinue)
Add-Code ($kbd | Sort-Object Status | Format-Table Status, Class, FriendlyName, InstanceId -AutoSize)

$allPnp   = Get-PnpDevice -ErrorAction SilentlyContinue
$broken   = $allPnp | Where-Object { $_.Status -eq 'Error' -or $_.Status -eq 'Unknown' }
$lightDev = $allPnp | Where-Object { $_.FriendlyName -match 'light|led|rgb|aura|backlit|ite |ene ' }
Add-Line 'Devices in error/unknown state:'
Add-Code ($broken | Format-Table Status, Class, FriendlyName, InstanceId -AutoSize)
Add-Line 'Lighting-related devices:'
Add-Code ($lightDev | Format-Table Status, Class, FriendlyName, InstanceId -AutoSize)
foreach ($d in $broken | Where-Object { $_.Class -in 'Keyboard','HIDClass','System' -and $_.FriendlyName -match $vendorRx }) {
    Add-Finding 'CRITICAL' "Device '$($d.FriendlyName)' is in state '$($d.Status)' - its driver is likely the one that was removed. InstanceId: $($d.InstanceId)"
}

# --- 3. Driver store -------------------------------------------------------
Add-Heading '3. Driver store (pnputil /enum-drivers), vendor-related packages'
try {
    $raw    = (pnputil /enum-drivers | Out-String)
    $blocks = $raw -split "\r?\n\r?\n" | Where-Object { $_ -match $vendorRx }
    Add-Code ($blocks -join "`n`n")
    if (-not $blocks) {
        Add-Finding 'WARN' 'No vendor lighting/keyboard driver packages found in the driver store - consistent with a driver package having been deleted (see setupapi.dev.log section).'
    }
} catch { Add-Code "pnputil failed: $_" }

# --- 4. Registry: installed software ----------------------------------------
Add-Heading '4. Registry: installed software (Uninstall keys)'
$uninstPaths = @(
    'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*'
    'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*'
    'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*'
)
$apps      = Get-ItemProperty $uninstPaths -ErrorAction SilentlyContinue | Where-Object DisplayName
$lightApps = $apps | Where-Object { $_.DisplayName -match $suiteRx }
Add-Line 'Lighting suites currently installed:'
Add-Code ($lightApps | Sort-Object DisplayName | Format-Table DisplayName, DisplayVersion, InstallDate -AutoSize)
if (-not $lightApps) {
    Add-Finding 'WARN' "No keyboard-lighting suite is installed. Given the hardware ($($cs.Manufacturer) $($cs.Model)), the expected suite is: $expectedStack. If lighting worked before, the suite was uninstalled - check the MsiInstaller events below for when."
}

# --- 5. Registry: driver services -------------------------------------------
Add-Heading '5. Registry: lighting/keyboard driver services'
$svcPatterns = @(
    'WinRing0*','EneIo*','EneTechIo*','ene','ITE*','asusgio*','atkwmiacpi*',
    'ASUSOptimization','AsusCertService','LightingService','Rz*','Razer*',
    'Corsair*','LGHUB*','Logi*','SteelSeries*','MysticLight*','OpenRGB*',
    'SignalRgb*','kbdclass','kbdhid','i8042prt'
)
$startMap = @{ 0 = 'Boot'; 1 = 'System'; 2 = 'Auto'; 3 = 'Manual'; 4 = 'DISABLED' }
$svcRoot  = 'HKLM:\SYSTEM\CurrentControlSet\Services'
$svcKeys  = Get-ChildItem $svcRoot -ErrorAction SilentlyContinue | Where-Object {
    $n = $_.PSChildName
    @($svcPatterns | Where-Object { $n -like $_ }).Count -gt 0
}
$svcRows = foreach ($k in $svcKeys) {
    $p = Get-ItemProperty $k.PSPath -ErrorAction SilentlyContinue
    $img = $p.ImagePath
    $binExists = ''
    if ($img) {
        # Kernel drivers use paths like \SystemRoot\system32\... or system32\drivers\foo.sys
        $resolved = [Environment]::ExpandEnvironmentVariables(($img -replace '^\\\?\?\\','')) -replace '^\\SystemRoot', $env:SystemRoot
        if ($resolved -notmatch '^[A-Za-z]:') { $resolved = Join-Path $env:SystemRoot $resolved }
        $resolved = ($resolved -split ' -| /')[0].Trim('"')
        $binExists = if (Test-Path $resolved) { 'yes' } else { 'MISSING' }
        if ($binExists -eq 'MISSING') {
            Add-Finding 'CRITICAL' "Service '$($k.PSChildName)' still registered but its binary is gone: $resolved - the driver file was deleted."
        }
    }
    if ($p.Start -eq 4 -and $k.PSChildName -notin 'kbdclass','kbdhid','i8042prt') {
        Add-Finding 'CRITICAL' "Service/driver '$($k.PSChildName)' is DISABLED (Start=4). Re-enabling it may be the entire fix - see RESTORE-GUIDE.md section 3."
    }
    [pscustomobject]@{
        Name      = $k.PSChildName
        Start     = if ($null -ne $p.Start -and $startMap.ContainsKey([int]$p.Start)) { $startMap[[int]$p.Start] } else { $p.Start }
        BinExists = $binExists
        ImagePath = $img
    }
}
Add-Code ($svcRows | Format-Table Name, Start, BinExists, ImagePath -AutoSize)
if (-not ($svcKeys | Where-Object PSChildName -eq 'kbdclass')) {
    Add-Finding 'CRITICAL' "Core keyboard class driver service 'kbdclass' is missing from the registry - severe tampering; a System Restore is the safest fix."
}

# --- 6. Registry: keyboard class filters + driver blocklist ------------------
Add-Heading '6. Registry: keyboard class UpperFilters + vulnerable-driver blocklist'
$kbdClassKey = 'HKLM:\SYSTEM\CurrentControlSet\Control\Class\{4d36e96b-e325-11ce-bfc1-08002be10318}'
$cls = Get-ItemProperty $kbdClassKey -ErrorAction SilentlyContinue
Add-Code @(
    "UpperFilters : $($cls.UpperFilters -join ', ')"
    "(expected to contain: kbdclass)"
)
if ($cls -and ($cls.UpperFilters -notcontains 'kbdclass')) {
    Add-Finding 'CRITICAL' "Keyboard class UpperFilters does not contain 'kbdclass' (current: '$($cls.UpperFilters -join ', ')') - filter-driver tampering. See RESTORE-GUIDE.md section 4 before touching this key."
}
$ci = Get-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\CI\Config' -ErrorAction SilentlyContinue
Add-Code "VulnerableDriverBlocklistEnable : $($ci.VulnerableDriverBlocklistEnable) (1/missing = on, 0 = off)"

# --- 7. setupapi.dev.log: driver-store deletions -----------------------------
Add-Heading '7. setupapi.dev.log: driver package deletions / device uninstalls'
$saLog = Join-Path $env:windir 'INF\setupapi.dev.log'
if (Test-Path $saLog) {
    $hits = @(Select-String -Path $saLog -Pattern 'Delete Driver Package|Uninstall Device|DIF_REMOVE' -Context 0,3 -ErrorAction SilentlyContinue)
    Add-Line "Total matches: $($hits.Count) (showing last 40; each 'Section start' line below a match is its timestamp)"
    Add-Code (($hits | Select-Object -Last 40 | ForEach-Object {
        @($_.Line) + @($_.Context.PostContext) + '---'
    }) -join "`n")
    if ($hits | Where-Object { $_.Line -match 'Delete Driver Package' }) {
        Add-Finding 'CRITICAL' "setupapi.dev.log records 'Delete Driver Package' operations - a driver package WAS deleted from the driver store. The oemNN.inf / package name and timestamp are in section 7; match the timestamp against your Grok session."
    }
} else {
    Add-Code "$saLog not found"
}

# --- 8. Event logs -----------------------------------------------------------
Add-Heading "8. Event logs (last $Days days)"

Add-Line '### 8a. Service Control Manager: services installed (7045) / start-type changed (7040)'
$scm = Get-EventsSafe @{ LogName = 'System'; ProviderName = 'Service Control Manager'; Id = 7040, 7045; StartTime = $since }
Add-Code (Format-Events ($scm | Where-Object { $_.Message -match $vendorRx -or $_.Id -eq 7045 }))

Add-Line '### 8b. UserPnp: driver installs/updates (20001/20003), vendor-related'
$upnp = Get-EventsSafe @{ LogName = 'System'; ProviderName = 'Microsoft-Windows-UserPnp'; Id = 20001, 20003; StartTime = $since }
Add-Code (Format-Events ($upnp | Where-Object { $_.Message -match $vendorRx }))

Add-Line '### 8c. Kernel-PnP device events (400/410/420), vendor-related'
$kpnp = Get-EventsSafe @{ LogName = 'System'; ProviderName = 'Microsoft-Windows-Kernel-PnP'; Id = 400, 410, 420; StartTime = $since } 500
Add-Code (Format-Events ($kpnp | Where-Object { $_.Message -match $vendorRx }))

Add-Line '### 8d. MsiInstaller: product uninstalls (1034 / 11724)'
$msi = Get-EventsSafe @{ LogName = 'Application'; ProviderName = 'MsiInstaller'; Id = 1034, 11724; StartTime = $since }
Add-Code (Format-Events $msi)
foreach ($e in $msi | Where-Object { $_.Message -match $suiteRx }) {
    $m = $e.Message -replace '\s+', ' '
    if ($m.Length -gt 160) { $m = $m.Substring(0, 160) + '...' }
    Add-Finding 'CRITICAL' ("MSI uninstall of a lighting suite on {0:yyyy-MM-dd HH:mm}: {1}" -f $e.TimeCreated, $m)
}

Add-Line '### 8e. Windows Defender detections/actions (1116/1117)'
$def = Get-EventsSafe @{ LogName = 'Microsoft-Windows-Windows Defender/Operational'; Id = 1116, 1117; StartTime = $since }
Add-Code (Format-Events $def)
if ($def | Where-Object { $_.Message -match 'winring0|vulnerabledriver' }) {
    Add-Finding 'CRITICAL' 'Defender detected/quarantined a WinRing0-class driver. This (not necessarily Grok alone) breaks OpenRGB/SignalRGB-style keyboard lighting. See RESTORE-GUIDE.md section 5.'
}

Add-Line '### 8f. PowerShell script-block log (4104): driver-removal-shaped commands'
$ps = Get-EventsSafe @{ LogName = 'Microsoft-Windows-PowerShell/Operational'; Id = 4104; StartTime = $since } 3000
$psHits = $ps | Where-Object { $_.Message -match $cmdRx }
Add-Code (Format-Events ($psHits | Select-Object -First 60))
if ($psHits) {
    Add-Finding 'INFO' 'PowerShell script-block log captured driver-removal-shaped commands (section 8f) - these are likely the literal commands the agent ran, with timestamps.'
}

# --- 9. AI-agent local traces -------------------------------------------------
Add-Heading '9. Grok workspace + shell history traces'
$grokDirs = @("$env:USERPROFILE\.grok", "$env:USERPROFILE\GIT\grok", "$env:USERPROFILE\grok") | Where-Object { Test-Path $_ }
Add-Line "Workspaces found: $(if ($grokDirs) { $grokDirs -join '; ' } else { '(none)' })"
foreach ($dir in $grokDirs) {
    $files = Get-ChildItem $dir -Recurse -File -ErrorAction SilentlyContinue |
        Where-Object { $_.Length -lt 5MB -and $_.Extension -match '^\.(log|txt|md|json|jsonl|ps1)$' -and $_.FullName -notmatch 'node_modules' }
    $traceHits = $files | Select-String -Pattern $cmdRx, 'backlight|keyboard\s*light' -ErrorAction SilentlyContinue | Select-Object -First 80
    Add-Line "### $dir"
    Add-Code ($traceHits | ForEach-Object { "$($_.Path):$($_.LineNumber): $($_.Line.Trim())" })
    if ($traceHits) {
        Add-Finding 'INFO' "Grok workspace '$dir' contains driver-removal-related lines (section 9) - the agent's own record of what it did."
    }
}
$histPath = Join-Path $env:APPDATA 'Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt'
Add-Line '### PowerShell command history (PSReadLine)'
if (Test-Path $histPath) {
    Add-Code (Select-String -Path $histPath -Pattern $cmdRx -ErrorAction SilentlyContinue | ForEach-Object { $_.Line.Trim() } | Select-Object -Last 60)
} else {
    Add-Code "$histPath not found"
}

# --- Assemble ------------------------------------------------------------------
$header = @(
    '# Keyboard-light driver forensic report'
    ''
    "- Generated  : $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    "- Machine    : $($cs.Manufacturer) $($cs.Model) ($env:COMPUTERNAME)"
    "- Scan window: last $Days days (since $($since.ToString('yyyy-MM-dd')))"
    "- Elevated   : $isAdmin"
    ''
    '## Summary of findings'
    ''
)
$summary = if ($script:Findings.Count) { @($script:Findings) }
           else { @('- No red flags detected by the automated checks. Walk the raw sections below; also try the firmware hotkey (Fn+Space / Fn+F4 etc.) - if even that fails, this may not be a driver problem at all.') }

@($header + $summary + $script:Sections) | Set-Content -Path $reportPath -Encoding UTF8

Write-Host ''
Write-Host "Report written to: $reportPath" -ForegroundColor Green
Write-Host "Findings flagged : $($script:Findings.Count)" -ForegroundColor $(if ($script:Findings.Count) { 'Yellow' } else { 'Green' })
Write-Host 'Next: open the report, then follow the matching section in RESTORE-GUIDE.md (or paste the report back into the Claude session).'
