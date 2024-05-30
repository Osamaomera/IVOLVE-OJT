# Docker Role

This Ansible role installs Docker on the target hosts and adds a specified user to the Docker group.

## Requirements

- Ansible 2.9+
- Supported platforms: Ubuntu

## Role Variables

- `docker_user`: The username to add to the Docker group. This variable must be defined in your playbook or inventory.

## Example Playbook

```yaml
- hosts: all
  become: yes
  vars:
    docker_user: "your_username"
  roles:
    - docker
