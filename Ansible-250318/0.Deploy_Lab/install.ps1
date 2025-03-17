$uncPath = "\\10.50.141.4\share\AnyViewerSetup.exe"
$tempFile = "$env:TEMP\AnyViewerSetup.exe"
Copy-Item -Path $uncPath -Destination $tempFile -Force
Unblock-File -Path $tempFile
$installArgs = "/silent"
Start-Process -FilePath $tempFile -ArgumentList $installArgs -Wait -PassThru
Remove-Item -Path $tempFile -Force