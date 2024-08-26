sudo apt update
sudo apt install software-properties-common -y
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y
sudo apt list --installed | grep -i ansible

sudo apt install python3-pip -y

pip install --upgrade git+https://github.com/vmware/vsphere-automation-sdk-python.git --break-system-packages

echo 'export PATH=$PATH:~/.local/bin' >> ~/.bashrc
source ~/.bashrc
echo $PATH

ls -al /usr/bin/ansible*
ls -al ~/.local/lib/python*/site-pack*/
ls -al /usr/lib/python3/dist*/ansible_col*/
pip list
