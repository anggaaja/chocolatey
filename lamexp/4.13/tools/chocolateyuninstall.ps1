$ErrorActionPreference = 'Stop';
$packageName = 'lamexp'
$softwareName = 'LameXP v4.13'
$installerType = 'EXE' 
$silentArgs = '/S'
$validExitCodes = @(0)
$uninstalled = $false
$processor = Get-WmiObject Win32_Processor
$is64bit = $processor.AddressWidth -eq 64
$entry64 = 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{FBD7A67D-D700-4043-B54F-DD106D00F308}'
$entry32 = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{FBD7A67D-D700-4043-B54F-DD106D00F308}'
 
if ($is64bit) {
  $setupExePath = (Get-ItemProperty -Path $entry64).QuietUninstallString
}
else {
  $setupExePath = (Get-ItemProperty -Path $entry32).QuietUninstallString
}
	$scriptPath = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
	$ahkFile = Join-Path $scriptPath "lamexpUninstall.ahk"
	$ahkRun = "$Env:Temp\$(Get-Random).ahk"
 
	Copy-Item $ahkFile "$ahkRun" -Force
	$ahkProc = Start-Process -FilePath 'AutoHotKey' `
				-ArgumentList $ahkRun `
				-PassThru
	Write-Debug "$ahkRun start time:`t$($ahkProc.StartTime.ToShortTimeString())"
	Write-Debug "$ahkRun process ID:`t$($ahkProc.Id)"

    Uninstall-ChocolateyPackage -PackageName $packageName `
                                -FileType $installerType `
                                -SilentArgs "$silentArgs" `
                                -ValidExitCodes $validExitCodes `
                                -File "$setupExePath"
	
	Remove-Item "$ahkRun" -Force


