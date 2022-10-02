#!/bin/bash

function create_directory {
    if [ -d $1 ]; 
        then
            echo "Directory $1 already exists"
    else
        mkdir $1
    fi
}

function create_group_and_set_permissions {
    groupadd $1
    chown root:$1 $2
    chmod 770 $2
}

function create_user {
    useradd $1 -m -c $2 -s /bin/bash -G $3 -p $(openssl passwd -crypt Pass123)
}

echo "Creating directories..."

create_directory /sys/public
create_directory /sys/adm
create_directory /sys/ven
create_directory /sys/sec

echo "Creating user groups and adding directory permissions..."

create_group_and_set_permissions GRP_ADM /sys/adm
create_group_and_set_permissions GRP_VEN /sys/ven
create_group_and_set_permissions GRP_SEC /sys/sec

chmod 777 /sys/public

echo "Creating users with respective groups..."

create_user carlos "Carlos da Silva" GRP_ADM
create_user maria "Maria Santos" GRP_ADM
create_user joao "João Paulo" GRP_ADM
create_user debora "Débora Bittencour" GRP_VEN
create_user sebastiana "Sebastiana Maria" GRP_VEN
create_user roberto "Roberto Brito" GRP_VEN
create_user josefina "Josefina medeiros" GRP_SEC
create_user amanda "Amanda Luiza" GRP_SEC
create_user rogerio "Rogério Amahni" GRP_SEC

echo "Finished..."