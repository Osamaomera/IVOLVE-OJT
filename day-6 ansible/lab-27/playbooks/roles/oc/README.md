# OpenShift CLI (oc) Role

This Ansible role installs the OpenShift CLI (oc) on the target host.

## Tasks

The role performs the following tasks:

1. **Download oc CLI**: Downloads the OpenShift CLI tarball from the official release.
2. **Extract oc CLI**: Extracts the tarball to the `/usr/local/bin` directory.
3. **Ensure oc CLI is Executable**: Ensures that the `oc` binary is executable.

## Directory Structure

roles/oc/
├── README.md
└── tasks
└── main.yml


## Role Variables

No variables are required for this role.

## Usage

Include the `oc` role in your playbook:

```yaml
- hosts: all
  become: yes
  roles:
    - oc
```
