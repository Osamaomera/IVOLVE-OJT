# Jenkins Role

This Ansible role installs Jenkins on the target hosts.

## Requirements

- Ansible 2.9+
- Supported platforms: Ubuntu

## Role Variables

No specific variables are required for this role.

## Example Playbook

```yaml
- hosts: all
  become: yes
  roles:
    - jenkins
