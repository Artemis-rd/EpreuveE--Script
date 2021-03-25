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

$x = Import-Csv C:\Temp\test.csv
$f = $x[0] | Get-Member -MemberType NoteProperty | Select name
$f | Add-Member -Name count -Type NoteProperty -Value 0
$f | %{
  $n = $_.Name
  $_.Count = @($x | Select $n -ExpandProperty $n | ? {$_ -ne ''}).count
}
$f = @($f | ? {$_.count -gt 0} | Select Name -expandproperty Name)

$f = $f | Foreach-Object { "$_" } 

$x | Select $f | Export-Csv C:\Temp\test.csv -NoTypeInformation