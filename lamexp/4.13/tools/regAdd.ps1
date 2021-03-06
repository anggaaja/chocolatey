# This adds a registry key which LameXP 4.13 needed for automated unattended silent uninstall. Untested on 32bit Machine.
# Dirty workaround since passing the /S parameter still producing the "Could not Detect" notification if user doesn't pass the -y parameter while uninstalling.
$processor = Get-WmiObject Win32_Processor
$is64bit = $processor.AddressWidth -eq 64
$regDirLameXP64 = 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{FBD7A67D-D700-4043-B54F-DD106D00F308}'
$regDirLameXP32 = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{FBD7A67D-D700-4043-B54F-DD106D00F308}'
if ($is64bit) {
  if (-not(Test-Path $regDirLameXP64)) {New-Item $regDirLameXP64 -ItemType directory -Force}
  New-ItemProperty -Name "QuietUninstallString" -Path $regDirLameXP64 -PropertyType String -Value "C:\Program Files (x86)\MuldeR\LameXP v4.13\Uninstall.exe" -Force
} else {
  New-ItemProperty -Name "QuietUninstallString" -Path $regDirLameXP32 -PropertyType String -Value "C:\Program Files\MuldeR\LameXP v4.13\Uninstall.exe" -Force
}

