Get-NetIPAddress -IPAddress 10.10.10.1 | Remove-NetIPAddress
Remove-NetLbfoTeamNIC -Team "LabVlan" -Name  "VLAN10" -Confirm:$false
Remove-NetLbfoTeam -Name "LabVlan" -Confirm:$false
New-NetIPAddress -IPAddress 10.10.10.1 -InterfaceAlias ethernet0 -PrefixLength 24 -Confirm:$false
