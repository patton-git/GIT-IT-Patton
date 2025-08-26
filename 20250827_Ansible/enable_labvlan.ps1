Get-NetIPAddress -IPAddress 10.10.10.1 | Remove-NetIPAddress
New-NetLbfoTeam -Name "LabVlan" -TeamMembers "Ethernet0" -TeamingMode SwitchIndependent -LoadBalancingAlgorithm Transport -confirm:$false
Add-NetLbfoTeamNic -Team "LabVlan" -VlanID 10 -Name "VLAN10" -confirm:$false
Add-NetLbfoTeamNic -Team "LabVlan" -VlanID 11 -Name "VLAN11" -confirm:$false
Add-NetLbfoTeamNic -Team "LabVlan" -VlanID 12 -Name "VLAN12" -confirm:$false
Add-NetLbfoTeamNic -Team "LabVlan" -VlanID 13 -Name "VLAN13" -confirm:$false
Add-NetLbfoTeamNic -Team "LabVlan" -VlanID 14 -Name "VLAN14" -confirm:$false
Add-NetLbfoTeamNic -Team "LabVlan" -VlanID 15 -Name "VLAN15" -confirm:$false
New-NetIPAddress -InterfaceAlias "VLAN10" -IPAddress 10.10.10.1 -PrefixLength 24
New-NetIPAddress -InterfaceAlias "VLAN11" -IPAddress 10.10.11.1 -PrefixLength 24
New-NetIPAddress -InterfaceAlias "VLAN12" -IPAddress 10.10.12.1 -PrefixLength 24
New-NetIPAddress -InterfaceAlias "VLAN13" -IPAddress 10.10.13.1 -PrefixLength 24
New-NetIPAddress -InterfaceAlias "VLAN14" -IPAddress 10.10.14.1 -PrefixLength 24
New-NetIPAddress -InterfaceAlias "VLAN15" -IPAddress 10.10.15.1 -PrefixLength 24
Disable-NetAdapterBinding -Name "*" -ComponentID ms_tcpip6
New-NetFirewallRule -DisplayName "Allow inbound ICMPv4" -Protocol ICMPv4 -IcmpType 8 -Direction Inbound -Action Allow -Enabled True -Profile Any
