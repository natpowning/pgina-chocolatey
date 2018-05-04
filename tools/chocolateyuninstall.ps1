
$ErrorActionPreference = 'Stop'; # stop on all errors
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'pGina*'
  fileType      = 'exe'
  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

$uninstalled = $false

[array]$key = Get-UninstallRegistryKey -SoftwareName $packageArgs['softwareName']

$key | % { 
  $packageArgs['file'] = "$($_.UninstallString)"

  Uninstall-ChocolateyPackage @packageArgs
}

