<#.SYNOPSIS	
Gets the programs that are installed on the local computer or a remote computer.
.DESCRIPTION
Get the programs that are installed on the local computer or a remote computer.
.PARAMETER ComputerName
localhost by default.
.PARAMETER Vendor
All vendors by default. Supports wildcards.
#>
param([string] $ComputerName = 'localhost', [string] $Vendor = '*')

Get-WmiObject Win32_Product -ComputerName $ComputerName | Where-Object { $_.Vendor -like $Vendor } | Sort-Object Name | Format-Table Name, Version