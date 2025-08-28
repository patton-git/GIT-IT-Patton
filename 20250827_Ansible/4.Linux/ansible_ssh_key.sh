ssh-keygen -t ed25519 -C "ubuntu@controller" -f ~/.ssh/ansible_key -N ""

## ansible_ssh_key copy menually
# ssh-copy-id -i ~/.ssh/ansible_key.pub ansible@k8s-controller3
# ssh ansible@k8s-controller3 -i ~/.ssh/ansible_key

## ansible_ssh_key copy using playbook
ansible-playbook -i inventory.yaml ansible_key_deploy.yaml -K -vv
