#!/bin/sh

# read -p "Create log files? (y) > " addlog

# install nginx
if [[ $1 == 'y' ]] || [[ $1 == 'yes' ]]
then
  echo "stage01: Install nginx"
  ansible-playbook -i hosts nginx.yaml --tags install_nginx > 01install_nginx.log
  echo "stage02: Start nginx service"
  ansible-playbook -i hosts nginx.yaml --tags start_nginx > 02start_nginx.log
  echo "stage03: Add nginx service as autorun"
  ansible-playbook -i hosts nginx.yaml --tags enable_nginx > 03enable_nginx.log
  echo "stage04: Disable nginx service"
  ansible-playbook -i hosts nginx.yaml --tags disable_nginx > 04disable_nginx.log
  echo "stage05: Stop nginx service"
  ansible-playbook -i hosts nginx.yaml --tags stop_nginx > 05stop_nginx.log
  echo "stage06: Uninstall nginx"
  ansible-playbook -i hosts nginx.yaml --tags uninstall_nginx > 06uninstall_nginx.log
  echo "stage07: Install zip, unzip, gzip, nano"
  ansible-playbook -i hosts tools.yaml --tags install > 07install_tools.log
  echo "stage08: Uninstall unzip, nano"
  ansible-playbook -i hosts tools.yaml --tags uninstall > 08uninstall_tools.log

else
  echo "yes parameter not found. No logs will be created." 
  
  echo "stage01: Install nginx"
  ansible-playbook -i hosts nginx.yaml --tags install_nginx
# start nginx service
  echo "stage02: Start nginx service"
  ansible-playbook -i hosts nginx.yaml --tags start_nginx

# enable nginx startup service 
  echo "stage03: Add nginx service as autorun"
  ansible-playbook -i hosts nginx.yaml --tags enable_nginx

# disabe nginx startup service
  echo "stage04: Disable nginx service"
  ansible-playbook -i hosts nginx.yaml --tags disable_nginx

# stop nginx service
  echo "stage05: Stop nginx service"
  ansible-playbook -i hosts nginx.yaml --tags stop_nginx

#uninstall nginx
  echo "stage06: Uninstall nginx"
  ansible-playbook -i hosts nginx.yaml --tags uninstall_nginx

# --------------------------------------------------------------------------
  # install tools
  echo "stage07: Install zip, unzip, gzip, nano"
  ansible-playbook -i hosts tools.yaml --tags install

  #uninstall tools
  echo "stage08: Uninstall unzip, nano"
  ansible-playbook -i hosts tools.yaml --tags uninstall
fi
