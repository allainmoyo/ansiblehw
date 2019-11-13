#!/bin/sh
# install nginx
ansible-playbook -i hosts nginx.yaml --tags install_nginx > 01install_nginx.log

# start nginx service
ansible-playbook -i hosts nginx.yaml --tags start_nginx > 02start_nginx.log

# enable nginx startup service 
ansible-playbook -i hosts nginx.yaml --tags enable_nginx > 03enable_nginx.log

# disabe nginx startup service
ansible-playbook -i hosts nginx.yaml --tags disable_nginx > 04disable_nginx.log

# stop nginx service
ansible-playbook -i hosts nginx.yaml --tags stop_nginx > 05stop_nginx.log

#uninstall nginx
ansible-playbook -i hosts nginx.yaml --tags uninstall_nginx > 06uninstall_nginx.log

# --------------------------------------------------------------------------
# install tools
ansible-playbook -i hosts tools.yaml --tags install > 07install_tools.log

#uninstall tools
ansible-playbook -i hosts tools.yaml --tags uninstall > 08uninstall_tools.log

