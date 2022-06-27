## https://developer.vmware.com/docs/powercli/latest/products/vmwarevsphereandvsan/
Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false | Out-Null
Connect-VIServer -Server vcsa.edu.git -Protocol https -User administrator@vsphere.local -Password VMware1!

## https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/read-host?view=powershell-7.2
## $ID = Read-Host "Please enter your Lab or Student ID:  (ex:S00, H00)"
$ID = 'S02'

Get-Folder $ID | get-vm | Where-object {$_.powerstate -eq 'poweredon'} | Stop-VM -Confirm:$false -RunAsync
Get-Folder $ID | Remove-Folder -DeletePermanently

Remove-VirtualSwitch -VirtualSwitch $ID -Confirm:$false

