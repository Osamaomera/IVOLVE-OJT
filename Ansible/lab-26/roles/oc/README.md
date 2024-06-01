# OpenShift CLI (oc) Role

This Ansible role installs the OpenShift CLI (oc) on the target hosts.

## Requirements

- Ansible 2.9+
- Supported platforms: Ubuntu

## Role Variables

- `oc_version`: The version of the OpenShift CLI to install. This variable must be defined in your playbook or inventory.

## Example Playbook

```yaml
- hosts: all
  become: yes
  vars:
    oc_version: "4.10.1"
  roles:
    - oc
