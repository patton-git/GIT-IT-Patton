## WSL - Ubuntu
## sudo sed -i '/ad\.vclass\.local/s/^/#/' /etc/hosts
echo '' | openssl s_client -connect dc:5986

## MMC -> Ctrl+M  -> Certificates (Local Machine)
## windows mmc - certificates에서 export  -> dc.cer
## dc.cer 파일을 wsl Ubuntu 내부로 복사
## cp /mnt/c/Users/Administrator/Desktop/dc.cer ~/

## https://documentation.ubuntu.com/server/how-to/security/install-a-root-ca-certificate-in-the-trust-store/index.html
sudo openssl x509 -inform der -outform pem -in dc.cer -out dc.crt
sudo apt-get install -y ca-certificates
sudo cp dc.crt /usr/local/share/ca-certificates
sudo update-ca-certificates
