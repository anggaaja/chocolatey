# This adds a registry key which LameXP 4.13 needed for automated silent uninstall. Untested.
# Dirty workaround and I'm not sure what to edit for 32-bit machine.
$processor = Get-WmiObject Win32_Processor
$is64bit = $processor.AddressWidth -eq 64
$regDirLameXP64 = 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{FBD7A67D-D700-4043-B54F-DD106D00F308}'
if ($is64bit) {
  if (-not(Test-Path $regDirLameXP64)) {New-Item $regDirLameXP64 -ItemType directory -Force}
  New-ItemProperty -Name "QuietUninstallString" -Path $regDirLameXP64 -PropertyType String -Value "C:\Program Files (x86)\MuldeR\LameXP v4.13\Uninstall.exe /S" -Force
}

