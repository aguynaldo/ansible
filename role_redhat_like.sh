#!/bin/bash

### Function to read the constants of the .env file
read_var() {
    VAR=$(grep $1 $2 | xargs)
    IFS="=" read -ra VAR <<< "$VAR"
    echo ${VAR[1]}
}

### Setting the CONSTANT to set the root password (Operating system)
ROOT_PASS=$(read_var ROOT_PASS /vagrant/.env)

# Setting root password
#echo "[TASK 1] Configurando root password"; sleep 3
#echo -e "$ROOT_PASS\n$ROOT_PASS" | passwd root

# Configurando o ssh por senha
echo "[TASK 2] Configurando o SSH para aceitar conexão por senha."; sleep 3
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
systemctl restart sshd.service


# Instalando o Python 
echo "[TASK 3] Instalando o Python 3.8 e o vim"
dnf makecache
dnf install epel-release -y 
dnf makecache
dnf install python3 vim -y

