$ErrorActionPreference = 'Stop';
$packageName = 'lamexp'
$version = '4.13'
$url = 'https://github.com/lordmulder/LameXP/releases/download/Release_413/LameXP.2015-12-12.Release-Static.Build-1852.exe'


$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = $url
  silentArgs = '/S'
  validExitCodes = @(0)
  checksum      = '7929A60D4E785494D95DB195CCED4AE1'
  checksumType  = 'md5'
}

$regAdd = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)\regAdd.ps1"
Start-ChocolateyProcessAsAdmin "& `'$regAdd`'"

Install-ChocolateyPackage @packageArgs

















