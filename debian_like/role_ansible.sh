#!/bin/bash


echo "[TASK 1] Configurando o SSH para aceitar conexão por senha."; sleep 3
sed -i 's/^PasswordAuthentication/#PasswordAuthentication/g' /etc/ssh/sshd_config
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
systemctl restart sshd.service

# # Instalando o Python 
echo "[TASK 2] Instalando o Ansible e dependências"
apt update
apt install ansible sshpass python-apt -y
