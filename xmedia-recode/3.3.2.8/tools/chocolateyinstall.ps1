$ErrorActionPreference = 'Stop';
$packageName = 'xmedia-recode'
$version = '3.3.2.8'
$url        = 'http://www.xmedia-recode.de/download/XMediaRecode3328_setup.exe'


$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = $url
  silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
  checksum      = 'A9585939FAC052FDF4987FFBDC16B4D1'
  checksumType  = 'md5'
}

Install-ChocolateyPackage @packageArgs

















