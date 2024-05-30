# Jenkins Role

This Ansible role installs and configures Jenkins on the target host.

## Tasks

The role performs the following tasks:

1. **Install Jenkins**: Installs the Jenkins package using the system's package manager.
2. **Start Jenkins Service**: Ensures that the Jenkins service is started and enabled to start on boot.

## Directory Structure

roles/jenkins/
├── README.md
└── tasks
└── main.yml

## Role Variables

No variables are required for this role.

## Usage

Include the `jenkins` role in your playbook:

```yaml
- hosts: all
  become: yes
  roles:
    - jenkins
```

