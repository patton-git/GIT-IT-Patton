## Default
sudo apt update
sudo apt install software-properties-common -y
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y
sudo apt list --installed | grep -i ansible

ls -al /usr/bin/ansible*
ls -al /usr/lib/python3/dist*/ansible_col*/

## pip = package installer for python
sudo apt install python3-pip -y
mkdir -p ~/.config/pip
echo -e "[global]\nbreak-system-packages=true" > ~/.config/pip/pip.conf
pip list

## Windows Credential 
pip list | grep -i pywinrm
pip install requests-credssp --break-system-packages

## VMware vSphere Automation SDK
pip install --upgrade git+https://github.com/vmware/vsphere-automation-sdk-python.git --break-system-packages
ls -al ~/.local/lib/python*/site-pack*/

## User conveniences
echo 'export PATH=$PATH:~/.local/bin' >> ~/.bashrc
echo 'export ANSIBLE_CONFIG=./ansible.cfg'  >> ~/.bashrc
source ~/.bashrc
echo 'autocmd FileType yaml setlocal ai ts=2 sw=2 et nu' >> ~/.vimrc
