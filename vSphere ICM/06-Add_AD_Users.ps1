Import-Module ActiveDirectory

$dcpath="DC=vclass,DC=local"
$ou="Student"
New-ADOrganizationalUnit -Name $ou -Path $dcpath


$oupath=$ou+","+$dcpath
## Get-ADOrganizationalUnit -Identity $oupath | Set-ADObject -ProtectedFromAccidentalDeletion:$false -PassThru | Remove-ADOrganizationalUnit -Confirm:$false

$groupname="Students"
New-ADGroup -Name $groupname -GroupCategory Security -GroupScope Global -DisplayName $groupname -Path $oupath

$count=0..10
foreach ($i in $count)
{ 
  $username="S" + "{0:d2}" -f $i
  New-AdUser -Name $username -Path $oupath -Enabled $True -AccountPassword (ConvertTo-SecureString "VMware1!" -AsPlainText -force) -passThru  -PasswordNeverExpires 1

  Add-ADGroupMember -Identity $groupname -Members $username
 }