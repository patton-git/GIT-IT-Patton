## WSL - Ubuntu
## sudo sed -i '/ad\.vclass\.local/s/^/#/' /etc/hosts
echo '' | openssl s_client -connect ad:5986

## MMC -> Ctrl+M  -> Certificates (Local Machine)
## windows mmc - certificates에서 export  -> ad.cer
## ad.cer 파일을 wsl Ubuntu 내부로 복사

## https://documentation.ubuntu.com/server/how-to/security/install-a-root-ca-certificate-in-the-trust-store/index.html
sudo openssl x509 -inform der -outform pem -in ad.cer -out ad.crt
sudo apt-get install -y ca-certificates
sudo cp ad.crt /usr/local/share/ca-certificates
sudo update-ca-certificates
