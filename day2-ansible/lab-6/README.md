# Lab-6
## Ansible Playbook to Install mysql database and create a user to query database
This repository contains an Ansible playbook to install mysql database on target host and create a mysql users that can query data and creat tables.

### Usage
1. install ansible automation platform.
    ```
    sudo apt install ansible #for ubuntu
    sudo dnf install ansible #for redhat
    ```
2. clone the repository or download the `lab-5` folder to your local machine.
    ```sh
    git clone https://github.com/Osamaomera/IVOLVE-OJT.git
    ```
3. look at my inventory file:
     ```
        [my_hosts]
        host1 ansible_host=192.168.183.131 ansible_user=osama
        [all:vars]  
        ansible_ssh_private_key_file=~/.ssh/id_rsa_ansible
    ```
4. add a secret file that contain the mysql credentials 
    ```sh
    mysql_root_password: "root"
    mysql_username: "osama"
    mysql_password: "osama"
    mysql_database: "ivolve-test"
    ansible_host: "192.168.183.131"
    sudo_password: "osama"
    ```
5. run ansible-vault to encrypt this secret file  
    ```sh
    ansible-vault encrypt ./vars/mysql_credentials.yml
    ```
6. create a dump.sql a simple table to put into the ivolve-test database
    ```
    CREATE TABLE IF NOT EXISTS test (message varchar(255) NOT NULL) 
    ENGINE=MyISAM DEFAULT CHARSET=utf8;         
    INSERT INTO test(message) VALUES('Ansible To Do List');
    INSERT INTO test(message) VALUES('Get ready');         
    INSERT INTO test(message) VALUES('Ansible is fun')
    ```
7. Finally run the ansible playbook.yml
    ```sh
    ansible-playbook -i inventory playbook.yml --extra-vars ansible_sudo_pass=osama --ask-vault-pass
    ```

### Successfully run of ansible playbook  
![](playbook-output.png)

### ssh to connect to host which run mysql and show the login to mysql by osama 

![](nginx.png)

### The result Page when connect to nginx 

![](output-nginx.png)