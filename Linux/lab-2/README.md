# Lab 2 Shell Scripring Basics
This script collects system storage, CPU, and memory usage information and sends it via email to a specified Gmail address using `msmtp`.

## Prerequisites

1. **msmtp**: Ensure `msmtp` is installed and configured correctly.
2. **mailutils**: Install `mailutils` for `mailx` command if not already installed.

### Installation

1. **Install msmtp and mailutils**:
```bash
    sudo apt update
    sudo apt install msmtp mailutils
```
2. **Configure msmtp**:
    Create a `~/.msmtprc` file with the following content:

3. **Set Permissions**:
    Ensure the `~/.msmtprc` file has the correct permissions:
```bash
    chmod 600 ~/.msmtprc
```

### Usage
1. clone the repository or download the `alert-disk-usage.sh` script to your local machine.
2. Make script executable :
    ```sh
    chmod +x alert-disk-usage.sh
    ```
3. Run the script 
    ```sh
    ./alert-disk-usage.sh
    ```
###  Output of mail alert
 ![](alert.png)
    
### Output of message in mail 
 ![](message.png)
