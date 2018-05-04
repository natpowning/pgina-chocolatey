
$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/pgina/pgina/releases/download/v3.1.8.0/pGinaSetup-3.1.8.0.exe' # download url, HTTPS preferred

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  softwareName  = 'pGina*'

  checksum      = 'd9d229ab7ee495f2ae6670d8d19136721110cb7825a355ee21b397cf6254f7a7'
  checksumType  = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs

