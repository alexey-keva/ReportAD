cls
Import-Module ActiveDirectory -ErrorAction SilentlyContinue
$impfile="D:\ReportScripts\department.csv" 

$departments = Import-CSV  $impFile -Delimiter ";"
date  > d:\ReportScripts\reports.txt
$mm=0
foreach ($departament in $departments)
{

$dep = $departament.department
$name = $departament.name

$a = Get-ADUser -Filter {Enabled -eq $true} -SearchScope OneLevel  -SearchBase $dep | Measure-Object
$aa=$a.count
write-host "$aa ; $name "
[string]$aa +" - "+$name >> d:\ReportScripts\reports.txt
$mm = $mm + $aa

}
'Общее количество ' + [string]$mm >> d:\ReportScripts\reports.txt