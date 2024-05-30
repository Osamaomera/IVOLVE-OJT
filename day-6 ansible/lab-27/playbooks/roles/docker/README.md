# Docker Role

This Ansible role installs and configures Docker on the target host.

## Tasks

The role performs the following tasks:

1. **Install Docker**: Installs the Docker package using the system's package manager.
2. **Start Docker Service**: Ensures that the Docker service is started and enabled to start on boot.
3. **Add User to Docker Group**: Adds the current user to the Docker group to allow Docker commands to be run without `sudo`.

## Directory Structure

roles/docker/
├── README.md
└── tasks
└── main.yml


## Role Variables

No variables are required for this role.

## Usage

Include the `docker` role in your playbook:

```yaml
- hosts: all
  become: yes
  roles:
    - docker
```

