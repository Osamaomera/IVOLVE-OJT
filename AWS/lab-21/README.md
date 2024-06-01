# Lab 21 
## Objective
Create a VPC with 2 subnets, launch 2 EC2 instances with Nginx and Apache installed, and configure a Load Balancer to access the web servers.

## Prerequisites
- AWS account with necessary permissions.
- Basic knowledge of VPC, EC2, and Load Balancers in AWS.

## Steps

## First Log in and search for service:
1. Log in to AWS Management Console: Go to AWS Management Console.
2. Navigate to VPC Dashboard: In the Services menu, under Networking & Content Delivery, select VPC.


## Step 1: Create a VPC

1. Click on “Your VPCs” in the left menu.
2. Click on “Create VPC”.

    ![](screenshots/vpc1.png)



3. Enter a Name tag (e.g., MyVPC).
4. Set IPv4 CIDR block (e.g., 10.0.0.0/16).
5. Leave IPv6 CIDR block as default (No IPv6 CIDR Block).
6. Tenancy: Default.

    ![](screenshots/vpc2.png)

7. Click on “Create VPC”.
    
*******************************************************************

## Step 2: Create Subnets
### Create Subnet 1:
1. In the VPC Dashboard, click on “Subnets” in the left menu.
2. Click on “Create subnet”.
    
    ![](screenshots/subnet1.png)

3. Select your VPC.
4. Name tag: PublicSubnet1.
5. Availability Zone: Choose one (e.g., us-east-1a).
6. IPv4 CIDR block: 10.0.1.0/24.

    ![](screenshots/subnet2.png)

7. Click on “Create subnet”.

### Create Subnet 2:
1. Click on “Create subnet” again.
2. Select your VPC.
3. Name tag: PublicSubnet2.
4. Availability Zone: Choose a different one (e.g., us-east-1b).
5. IPv4 CIDR block: 10.0.2.0/24.

    ![](screenshots/subnet3.png)

6. Click on “Create subnet”.

	![alt text](screenshots/subnets.png)
-------------------------------------------------------------------
## Step 3: Create internet gateway  

1. Click on **Internet gateways** in the left menu.
2. Create **Internet gateways**.

	![alt text](screenshots/igw1.png)
3. After create a **Internet gateways** click to **Attach to VPC**.
4. Choose **lab-21 VPC**.

	![alt text](screenshots/igw2.png)

------------------------------------------------------------------
## Step 4: Create Subnet Route Tables

1. Configure Route Table for Internet Access:
2. Click on **Route Tables** in the left menu.
3. Create a route table.

    ![](screenshots/rt1.png)

3. Name : **lab21-rt**
4. Choose the **lab-21 VPC**
5. Create route table.

    ![](screenshots/rt2.png)

6. Click on the **Routes** tab, then **Edit routes**.

    ![](screenshots/rt3.png)

4. Click on **Add route**.
5. Destination: 0.0.0.0/0.
6. Target: Select **Internet Gateway** (which we creat in **Step 3**).
7. CLick on **Save Changes**.

	![alt text](screenshots/rt4.png)

8. Associate Subnets with **Route Table:**
9. In the Route Tables view, select **Actions** .
10. Click on **Edit subnet associations**.

	![alt text](screenshots/rt5.png)

11. Select both **PublicSubnet-1** and **PublicSubnet-2**.
12. Click on **Save**.

	![alt text](screenshots/rt6.png)

## Step 4: Launch EC2 Instances
### Launch EC2 Instance 1 (Nginx):

1. Navigate to the EC2 Dashboard.
2. Click on **Launch Instance**.

	![alt text](screenshots/ec2-1.png)

3.  Choose an AMI (e.g., Amazon Linux 2).
4.  Choose an instance type (e.g., t2.micro).
5.  Configure instance details:
6.  Network: Select your VPC **lab-21 VPC**.
7.  Subnet: Select **PublicSubnet-1**.
8.  Auto-assign Public IP: **Enable**.
9.  Add storage as default.
10. Add tags (optional).
11. Configure Security Group:
12. Select an existing security group.
13. Allow HTTP (port 80) and SSH (port 22).

	![alt text](screenshots/ec2-2.png)

14. Review and Launch.

	![alt text](screenshots/nginx-ec2.png)

15. Connect to the instance using SSH and install Nginx:
```sh
	sudo yum update -y
	sudo yum install nginx -y
	sudo systemctl start nginx
	sudo systemctl enable nginx
```
![alt text](screenshots/nginx-ec2-1.png)

![alt text](screenshots/nginx-ec2-2.png)

![alt text](screenshots/nginx-ec2-3.png)
---------------------------------------------------------------------
## Launch EC2 Instance 2 (Apache):
### Repeat the steps above, but select **PublicSubnet-2** for the subnet.

![alt text](screenshots/apache-ec2-1.png)

```sh
	sudo yum update -y
	sudo yum install apache2 -y
	sudo systemctl start apache2
	sudo systemctl enable apache2
	sudo systemctl status apache2
```

![alt text](screenshots/apache-ec2-2.png)


--------------------------------------------------------------------

## Step 5: Create and Configure Load Balancer

1. Create Load Balancer:
2. Go to the EC2 Dashboard.
3. Click on **Load Balancers** in the left menu.
4. Click on **Create Load Balancer**.

	![alt text](screenshots/lb1.png)

5. Choose “Application Load Balancer”.

	![alt text](screenshots/lb2.png)

6. Name: MyLoadBalancer.
7. Scheme: Internet-facing.
8. IP address type: IPv4.
9. Listeners: HTTP (port 80).
10. VPC: Select your VPC **lab-21 VPC**.
11. Select both subnets (**PublicSubnet-1** and **PublicSubnet-2**).

	![alt text](screenshots/lb3.png)

12. Click on “Next: Configure Security Settings”.

13. Configure Security Group for Load Balancer:
14. Create a new security group for the load balancer or use an existing one.
15. Allow HTTP (port 80) inbound traffic.

16.	Configure Routing:
17. Create a target group:

	![alt text](screenshots/target-group.png)

18. Name: MyTargetGroup.
19. Target type: Instances.
20. Protocol: HTTP.
21. Port: 80.
22. VPC: Select your VPC.
23. Click on **Next: Register Target**.
24. Register Targets:
25. Select your EC2 instances (both Nginx and Apache).

	![alt text](screenshots/regestriestarget.png)

26. Click on **Include as pending below**.
27. Review your settings and click **Create target group**.

	![alt text](screenshots/target_group.png)

28. Select this **ivolve-targetgroup**.

	![alt text](screenshots/lb4.png)

29. Click on **Create load balancer**.

	![alt text](screenshots/lb.png)

-------------------------------------------------------------------

## Step 6: Test the Load Balancer

1. Get the DNS name of the Load Balancer:
2. Go to the Load Balancers section in the EC2 Dashboard.
3. Select your load balancer.
4. Copy the DNS name.

	![alt text](screenshots/lb5.png)
	

	## Access the Web Servers:

	![alt text](screenshots/lb-output.gif)

-----------------------------------------------------
