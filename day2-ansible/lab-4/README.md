# Lab-4
## Run ansible ad-hoc command into 3 servers
install ansible and configure automation paltform on control nodes, create inventory of 3 managed hosts and then perform ad-hoc commands to check functionallity.

### Usage
1. install ansible automation platform.
    ```
    sudo apt install ansible #for ubuntu
    sudo dnf install ansible #for redhat
    ```
2. clone the repository or download the `inventory` sfile to your local machine.

3. add 3 hosts to your invntory file:
    ```
    servera.lab.example.com
    serverb.lab.example.com
    serverc.lab.example.com
    ```
3. Run the ad-hoc command in ansible to 3 hosts 
    ```sh
    ansible all -i inventory -b -m shell -a 
    "useradd ivolve && touch /home/ivolve/file{1..3}.txt"
    ```
### Example Output 
    ```sh
    Server 192.168.1.63 is up and Running
    Server 192.168.1.64 is up and Running
    Server 192.168.1.65 is unreachable
    Server 192.168.1.66 is unreachable 
    ```
    