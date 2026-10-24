# Windows keyboard-light forensics

Traces how a keyboard lighting driver / vendor lighting suite was removed from
a Windows machine (e.g. by an AI agent session) using the registry, Windows
event logs, `setupapi.dev.log`, the driver store, and local agent session
traces — then maps each finding to a restore procedure.

**Usage** (on the affected Windows machine, elevated PowerShell):

```powershell
powershell -ExecutionPolicy Bypass -File .\Trace-KeyboardLight.ps1
```

The script is strictly read-only. It writes `kbd-light-report-<timestamp>.md`
to the Desktop; fix the flagged findings using the matching section of
[RESTORE-GUIDE.md](RESTORE-GUIDE.md). Options: `-Days 60` widens the event-log
window, `-OutDir C:\temp` changes where the report lands.
