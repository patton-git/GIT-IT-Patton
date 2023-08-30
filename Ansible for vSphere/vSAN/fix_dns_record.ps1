# 정방향 조회 도메인 만들기 
# Add-DnsServerPrimaryZone -Name "vclass.local" -ZoneFile "vclass.local.dns"



# 역방향 조회 도메인 만들기 
Add-DnsServerPrimaryZone -NetworkID 10.10.10.0/24 -ZoneFile "10.10.10.in-addr.arpa.dns"
Add-DnsServerPrimaryZone -NetworkID 10.10.20.0/24 -ZoneFile "20.10.10.in-addr.arpa.dns"
Add-DnsServerPrimaryZone -NetworkID 10.10.30.0/24 -ZoneFile "30.10.10.in-addr.arpa.dns"

# 역방향 조회 도메인 삭제하기
Remove-DnsServerZone "10.10.in-addr.arpa" -PassThru -Verbose -Force -confirm:$false 

# DNS 포워딩 
# Add-DnsServerForwarder -IPAddress 172.0.10.2 -PassThru

# Domain Controller Record 
#Add-DnsServerResourceRecordA -Name "sa-kms-01" -ZoneName "vclass.local" -IPv4Address "10.10.10.3"
Add-DnsServerResourceRecordPtr -Name "3" -ZoneName "10.10.10.in-addr.arpa" -PtrDomainName "sa-kms-01.vclass.local"

#Add-DnsServerResourceRecordA -Name "sa-vcsa-01" -ZoneName "vclass.local" -IPv4Address "10.10.10.10"
Add-DnsServerResourceRecordPtr -Name "10" -ZoneName "10.10.10.in-addr.arpa" -PtrDomainName "sa-vcsa-01.vclass.local"

#Add-DnsServerResourceRecordA -Name "sa-esxi-01" -ZoneName "vclass.local" -IPv4Address "10.10.10.11"
Add-DnsServerResourceRecordPtr -Name "11" -ZoneName "10.10.10.in-addr.arpa" -PtrDomainName "sa-esxi-01.vclass.local"

#Add-DnsServerResourceRecordA -Name "sa-esxi-02" -ZoneName "vclass.local" -IPv4Address "10.10.10.12"
Add-DnsServerResourceRecordPtr -Name "12" -ZoneName "10.10.10.in-addr.arpa" -PtrDomainName "sa-esxi-02.vclass.local"

#Add-DnsServerResourceRecordA -Name "sa-esxi-03" -ZoneName "vclass.local" -IPv4Address "10.10.10.13"
Add-DnsServerResourceRecordPtr -Name "13" -ZoneName "10.10.10.in-addr.arpa" -PtrDomainName "sa-esxi-03.vclass.local"

#Add-DnsServerResourceRecordA -Name "sa-esxi-04" -ZoneName "vclass.local" -IPv4Address "10.10.10.14"
Add-DnsServerResourceRecordPtr -Name "14" -ZoneName "10.10.10.in-addr.arpa" -PtrDomainName "sa-esxi-04.vclass.local"




#Add-DnsServerResourceRecordA -Name "sb-esxi-01" -ZoneName "vclass.local" -IPv4Address "10.10.20.11"
Add-DnsServerResourceRecordPtr -Name "11" -ZoneName "20.10.10.in-addr.arpa" -PtrDomainName "sb-esxi-01.vclass.local"

#Add-DnsServerResourceRecordA -Name "sb-esxi-02" -ZoneName "vclass.local" -IPv4Address "10.10.20.12"
Add-DnsServerResourceRecordPtr -Name "12" -ZoneName "20.10.10.in-addr.arpa" -PtrDomainName "sb-esxi-02.vclass.local"

#Add-DnsServerResourceRecordA -Name "sb-esxi-03" -ZoneName "vclass.local" -IPv4Address "10.10.20.13"
Add-DnsServerResourceRecordPtr -Name "13" -ZoneName "20.10.10.in-addr.arpa" -PtrDomainName "sb-esxi-03.vclass.local"

#Add-DnsServerResourceRecordA -Name "sb-esxi-04" -ZoneName "vclass.local" -IPv4Address "10.10.20.14"
Add-DnsServerResourceRecordPtr -Name "14" -ZoneName "20.10.10.in-addr.arpa" -PtrDomainName "sb-esxi-04.vclass.local"


#Add-DnsServerResourceRecordA -Name "sc-witness-01" -ZoneName "vclass.local" -IPv4Address "10.10.30.11"
Add-DnsServerResourceRecordPtr -Name "11" -ZoneName "30.10.10.in-addr.arpa" -PtrDomainName "sc-witness-01.vclass.local"

#Add-DnsServerResourceRecordA -Name "sc-witness-02" -ZoneName "vclass.local" -IPv4Address "10.10.30.12"
Add-DnsServerResourceRecordPtr -Name "12" -ZoneName "30.10.10.in-addr.arpa" -PtrDomainName "sc-witness-02.vclass.local"
