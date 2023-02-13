# https://learn.microsoft.com/en-us/windows-server/storage/nfs/deploy-nfs 
# https://learn.microsoft.com/en-us/windows-server/storage/nfs/nfs-overview?source=recommendations 
# https://learn.microsoft.com/en-us/powershell/module/nfs/new-nfsshare?view=windowsserver2022-ps
# https://learn.microsoft.com/en-us/powershell/module/nfs/set-nfsshare?view=windowsserver2022-ps 
# https://learn.microsoft.com/en-us/powershell/module/nfs/grant-nfssharepermission?view=windowsserver2022-ps 
# https://learn.microsoft.com/en-us/powershell/module/nfs/get-nfsshare?view=windowsserver2022-ps
# https://learn.microsoft.com/en-us/powershell/module/nfs/get-nfssharepermission?view=windowsserver2022-ps

Get-WindowsFeature *nfs*
Install-WindowsFeature FS-NFS-Service -IncludeAllSubFeature -IncludeManagementTools
Import-Module NFS


New-NfsShare -Name 'nfs01' -Path 'D:\nfs01' -EnableUnmappedAccess $True -Authentication sys


Grant-NfsSharePermission -Name 'nfs01' -ClientName 'all' -ClientType 'builtin' -Permission 'readwrite' -AllowRootAccess:$true
Grant-NfsSharePermission -Name 'nfs01' -ClientName 'all' -ClientType 'builtin' -Permission 'readwrite' -AllowRootAccess:$true

# Grant-NfsSharePermission -Name 'nfs01' -ClientName 'sa-esxi-01.vclass.local' -ClientType 'Host' -Permission 'readwrite' -AllowRootAccess:$true
# Grant-NfsSharePermission -Name 'nfs01' -ClientName 'sa-esxi-02.vclass.local' -ClientType 'Host' -Permission 'readwrite' -AllowRootAccess:$true
# Grant-NfsSharePermission -Name 'nfs01' -ClientName 'sa-esxi-03.vclass.local' -ClientType 'Host' -Permission 'readwrite' -AllowRootAccess:$true

Get-NfsShare
Get-NfsSharePermission
