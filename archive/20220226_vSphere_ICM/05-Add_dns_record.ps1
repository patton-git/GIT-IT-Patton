# 정방향 조회 도메인 만들기 
# Add-DnsServerPrimaryZone -Name "vclass.local" -ZoneFile "vclass.local.dns"

# 역방향 조회 도메인 만들기 
Add-DnsServerPrimaryZone -NetworkID 10.10.0.0/16 -ZoneFile "10.10.in-addr.arpa.dns"

# DNS 포워딩 
# Add-DnsServerForwarder -IPAddress 172.0.10.2 -PassThru

# Domain Controller Record
Add-DnsServerResourceRecordA -Name "sa-vcsa-01" -ZoneName "vclass.local" -IPv4Address "10.10.10.10"
Add-DnsServerResourceRecordPtr -Name "10.10" -ZoneName "10.10.in-addr.arpa" -PtrDomainName "sa-vcsa-01.vclass.local"

Add-DnsServerResourceRecordA -Name "sa-esxi-01" -ZoneName "vclass.local" -IPv4Address "10.10.10.11"
Add-DnsServerResourceRecordPtr -Name "11.10" -ZoneName "10.10.in-addr.arpa" -PtrDomainName "sa-esxi-01.vclass.local"

Add-DnsServerResourceRecordA -Name "sa-esxi-02" -ZoneName "vclass.local" -IPv4Address "10.10.10.12"
Add-DnsServerResourceRecordPtr -Name "12.10" -ZoneName "10.10.in-addr.arpa" -PtrDomainName "sa-esxi-01.vclass.local"

Add-DnsServerResourceRecordA -Name "sa-esxi-03" -ZoneName "vclass.local" -IPv4Address "10.10.10.13"
Add-DnsServerResourceRecordPtr -Name "13.10" -ZoneName "10.10.in-addr.arpa" -PtrDomainName "sa-esxi-01.vclass.local"
