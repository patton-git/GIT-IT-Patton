## https://docs.ansible.com/ansible/latest/os_guide/windows_winrm.html

## Poweshell version check
$PSVersionTable.PSVersion

## .NetFramework version check
Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP' -Recurse |
    Get-ItemProperty -Name Version,Release -ErrorAction SilentlyContinue |
    Where-Object { $_.PSChildName -match '^(?!S)\d' } |
    Select-Object PSChildName, Version, Release

## Winrm Listener Check
winrm enumerate winrm/config/Listener

## https://docs.ansible.com/ansible/latest/os_guide/windows_winrm.html
## 암호화되지 않은 Local 계정으로도 접근하여, 실행할 수 있도록 설정하기

winrm quickconfig

winrm get winrm/config/service
winrm set winrm/config/service '@{AllowUnencrypted="true"}'
winrm set winrm/config/service/Auth '@{Basic="true"}'

winrm get winrm/config/client
winrm set winrm/config/client '@{AllowUnencrypted="true"}'


## https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/enable-psremoting?view=powershell-7.4
## The Enable-PSRemoting cmdlet configures the computer to receive PowerShell remote commands that are sent by using the WS-Management technology.
Enable-PSRemoting -Force

Get-Item -Path WSMan:\localhost\Service\AllowUnencrypted
Set-Item -Path WSMan:\localhost\Service\AllowUnencrypted -Value True

Get-Item -Path WSMan:\localhost\Service\Auth\Basic
Set-Item -Path WSMan:\localhost\Service\Auth\Basic -Value True

Restart-Service WinRM
