$ErrorActionPreference = 'Stop';
$packageName = "musicbee"
$version = '3.0.5995'
$zipFile = "MusicBeeSetup_3_0_Update1.zip"
$exeFile = "MusicBeeSetup_3_0_Update1.exe"
$url = "http://musicbee.niblseed.com/$zipFile"
$checksum = 'EECD7BB9E6C09AFFEC31B8150B21FD98'
$checksumType  = 'md5'
$silentArgs = "/S"
$validExitCodes = @(0)

try { 
  $chocTempDir = Join-Path $env:TEMP "chocolatey"
  $tempDir = Join-Path $chocTempDir "$packageName"
  if (![System.IO.Directory]::Exists($tempDir)) {[System.IO.Directory]::CreateDirectory($tempDir)}
  $file = Join-Path $tempDir $zipFile
          
  Get-ChocolateyWebFile $packageName $file $url
  Get-ChocolateyUnzip $file $tempDir "" $packageName

  $file = Join-Path $tempDir $exeFile

  Install-ChocolateyInstallPackage $packageName 'exe' $silentArgs $file -validExitCodes $validExitCodes -Checksum "$checksum" -ChecksumType "$checksumType"

} catch {
  throw
}