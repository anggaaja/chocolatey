
$ErrorActionPreference = 'Stop';
$packageName = 'xmedia-recode'
$version = '3.3.2.5'
$url        = 'http://www.xmedia-recode.de/download/XMediaRecode3325_setup.exe'


$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = $url
  silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
  checksum      = '7583A091158115055832E89DA0CC47BF'
  checksumType  = 'md5'
}

Install-ChocolateyPackage @packageArgs

















