# Lab-3
## Shell Scripring Basics
This is a simple Bash script named `ping.sh` to ping all devices in a given subnet (`192.168.1.0/24`). 
The script pings each IP address in the subnet and reports whether the host is up or down.

### Usage
1. clone the repository or download the `ping.sh` script to your local machine.
2. Make script executable :
    ```sh
    chmod +x ping.sh
    ```

3. Run the script 
    ```sh
    ./ping.sh
    ```
### Example Output 

    ```sh
    Server 192.168.1.63 is up and Running
    Server 192.168.1.64 is up and Running
    Server 192.168.1.65 is unreachable
    Server 192.168.1.66 is unreachable 
    ```
    
