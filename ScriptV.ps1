$version = (Get-WmiObject -class Win32_OperatingSystem).Caption
$Date = Get-Date
$cn = $env:computername
$User = $env:UserName
$sn = wmic bios get serialnumber

Add-Content -Path C:\Temp\test.csv  -Value '"----------------"'

  

  $infopc = @(

  $version,$Date,$cn,$User,$sn,"----------------"
  )

  $infopc | foreach { Add-Content -Path  C:\Temp\test.csv -Value $_ }

