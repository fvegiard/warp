# Restore guide: keyboard lighting driver/software

Run `Trace-KeyboardLight.ps1` first. Each finding in its report maps to exactly
one section below. Do the **sanity checks** before anything else.

## 0. Sanity checks (no driver needed)

Many laptop keyboard backlights are firmware-driven and work with no software
installed:

- Try the hotkey: `Fn+Space` (Lenovo), `Fn+F4`/`Fn+F5` (ASUS), `Fn+F10` (Acer),
  `F5`/`F6` (HP OMEN), `Fn+F8` (Dell/Alienware).
- Check the backlight isn't just set to level 0 / timed out (most fade out
  after ~30 s idle; press any key).
- If the hotkey works, lighting *control* software was removed but the driver
  is fine — section 1 only.

## 1. Finding: "No keyboard-lighting suite is installed"

Reinstall the suite for your hardware (the report's *System* section names the
vendor):

| Vendor / suite | Reinstall |
|---|---|
| ASUS Armoury Crate | https://www.asus.com/supportonly/armoury-crate/helpdesk_download/ (use the full installer; it restores the ATK/aura kernel drivers too) |
| Lenovo Vantage | Microsoft Store, or `winget search "Lenovo Vantage"` |
| Alienware Command Center | Dell support page for your service tag, or Microsoft Store |
| MSI Center | Microsoft Store, or `winget search "MSI Center"` |
| HP OMEN Gaming Hub | Microsoft Store |
| Acer PredatorSense / NitroSense | Acer support page for your model |
| Razer Synapse | `winget install RazerInc.RazerInstaller` |
| Logitech G HUB | `winget install Logitech.GHUB` |
| Corsair iCUE | `winget search icue` (pick the latest iCUE package) |
| SignalRGB | `winget install WhirlwindFx.SignalRgb` |
| OpenRGB | `winget install CalcProgrammer1.OpenRGB` (use the latest version — older builds depend on the now-blocked WinRing0 driver) |

Verify winget IDs first with `winget search <name>` — IDs occasionally change.

## 2. Finding: "Delete Driver Package" in setupapi.dev.log

The report shows which package (`oemNN.inf` + driver name) was deleted and when.

1. **Easiest**: reinstall the vendor suite (section 1) — full installers
   re-deploy their kernel drivers.
2. **From Windows.old** (if present):
   `dir C:\Windows.old\Windows\System32\DriverStore\FileRepository | findstr /i <driverName>`
   then `pnputil /add-driver "<path>\<driver>.inf" /install`.
3. **From the vendor**: download the model-specific "ATK/System Interface/
   Hotkey/Lighting" driver from the vendor support page for the exact model
   shown in the report's System section, then install it.
4. Reboot, then Device Manager → *Action → Scan for hardware changes*.

## 3. Finding: service/driver DISABLED (Start=4)

The driver is still on disk — it was just turned off. For a **kernel driver**
(WinRing0, ene, ITE, asusgio):

```powershell
sc config <ServiceName> start= demand     # then reboot
```

For a **user-mode vendor service** (LightingService, Razer*, Corsair*):

```powershell
sc config <ServiceName> start= auto
sc start  <ServiceName>
```

## 4. Finding: UpperFilters tampered

⚠️ A wrong value here disables the keyboard entirely. Create a restore point
first (`Checkpoint-Computer -Description "before kbd filter fix"`), then:

```powershell
Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\Class\{4d36e96b-e325-11ce-bfc1-08002be10318}' `
    -Name UpperFilters -Value @('kbdclass') -Type MultiString
```

Reboot. If a vendor filter (e.g. a macro/lighting filter) was also legitimate
on this machine, reinstalling the vendor suite (section 1) re-adds it cleanly.

## 5. Finding: Defender quarantined WinRing0

Your lighting tool (OpenRGB/SignalRGB/FanControl-style) depends on the
WinRing0 driver, which Microsoft flags as `VulnerableDriver:WinNT/Winring0.*`
because of CVE-2020-14979 (any local process can use it to write kernel
memory).

**Recommended (safe)**: update the tool instead of restoring the driver —
current SignalRGB and recent OpenRGB builds ship replacement signed drivers
that don't trip Defender. Reinstall via section 1 and the lighting comes back.

**Not recommended**: Windows Security → *Protection history* → restore the
quarantined item and add an exclusion. This re-exposes CVE-2020-14979; only do
it if you accept that risk and no updated tool supports your device.

## 6. Nothing conclusive in the report

- **System Restore**: `rstrui.exe` → pick a restore point dated before the
  Grok session. This rolls back registry + driver store in one shot.
- **BIOS/EC reset**: power off, hold the power button 30 s (laptops), or reset
  BIOS defaults — embedded-controller glitches can kill the backlight in a way
  that looks exactly like a missing driver.
- Paste the generated report back into the Claude session for a targeted
  diagnosis.
