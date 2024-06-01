# Lab-19 (AWS Security)
## Objectives
Create AWS account, set billing alarm, create 2 IAM groups (admin-developer), admin group has admin permissions, developer group only access to 53, create admin-1 user console access only with MFA & admin-2-prog user with cli access only and list all users and groups using commands, create dev-user with programmatic and console access (take screenshots access EC2, S3)

## Step 1: Create AWS Account
- Go to the AWS website and sign up for an account.
- Follow the on-screen instructions to complete the registration.

![](screenshots/signup.png)

## Step 2: Set Billing Alarm with create a budget
1. Open the AWS Management Console.
2. In the Billing and Cost Management Dashboard, select Budgets from the navigation pane.
3. Click on Create a budget.
4. Configure Budget Details i choose use templates and zero spend budget 

    ![](screenshots/budget1.png)

5. next enter a budget name and specify your email to notify when threshold has exceeds
    
    ![](screenshots/budget2.png)

6. the click in create budget and your budget is created
    
    ![](screenshots/budget3.png)


## Step 3: Create IAM Groups
  ### 3.1 Create Admin Group
1. Open the IAM console.
2. Select User groups > Create group.    
3. Enter Admin for the group name.
    ![](screenshots/create-group.png) 

4. Attach the AdministratorAccess policy.
5. Click Create group.

### 3.2 Create Developer Group
1. Open the IAM console.
2. Select User groups > Create group.
    
    ![](screenshots/group1.png)
3. Enter developer for the group name and attach s3 full access.
    
    ![](screenshots/group-dev-2.png)

4. Click Create group then all two groups created.

    ![](screenshots/groups.png)

## Step 4: Create IAM Users
### 4.1 Create Admin User (admin-1)
 1. In the IAM console, select Users > Add user.
 2. Enter admin-1 for the user name.
 3. Select AWS Management Console access.
 4. Set a custom password and require password reset at next sign-in.

    ![](screenshots/admin1-create.png)
 5. Add the user to the Admin group.

    ![](screenshots/admin1-to-group.png)
 6. Review and Click Create user.
 ------------------------------------------------------------------------
### 4.2 Create Admin User (admin-2)
 1. In the IAM console, select Users > Add user.
 2. Enter admin-2 for the user name.
 3. Select AWS Management Console access.
 4. Set a custom password and require password reset at next sign-in.

    ![](screenshots/admin2-create.png)

5. Add the user to the Admin group.

    ![](screenshots/admin2-to-group.png)
 6. Review and Click Create user.
------------------------------------------------------------------------
### 4.3 Create developer User (dev)
 1. In the IAM console, select Users > Add user.
 2. Enter dev for the user name.
 3. Select AWS Management Console access.
 4. Set a custom password and require password reset at next sign-in.
    
    ![](screenshots/dev-create.png)
 5. Add the user to the developer group
        
    ![](screenshots/dev-to-group.png)
 6. Review and Click Create user.

     ![](screenshots/dev-reviewpng.png)
    ### All Users created
    ![](screenshots/users.png)
--------------------------------------------------------------

### MFA authentication to Admin-1 user to easily login to console
#### Assign MFA to user 
![](screenshots/mfa-for-admin1.png)

 1. setup device like authenticator application running in your device 
    ![](screenshots/mfa-mobile.png)

 2. Enter the code that show in your authenticator application and wait 30 seconds and enter another code 
    ![](screenshots/mfa.png)

3. Click Add MFA then the MFA add successfully
    ![](screenshots/enabled-mfa.png)


----------------------------------------------------------------------------

### Now we want to apply this user and try to login in with this users
### First with Admin-1 which has access to aws console and has a MFA to login 
1. sign in by IAM user by copy the code of Aws account and enter the username and password

    ![](screenshots/signin-admin-1.png)
2. Click Sign in .
3. After this will show The MFA window to enter the code that on the Authenticator app on your device 
    ![](screenshots/mfa-admin1.png)
4. After you enter the code Click Submit
5. Now you have adminstrator access on aws console 
    ![](screenshots/admin-1-console.png)

----------------------------------------------------------------------------------

### Now create a access key to admin-2 and dev user because enable me to access aws by command line interface 
1. go to users > admin-2 > security tab 
     
     ![](screenshots/admin-key-1png.png)

2. and Create Access key 
     
     ![](screenshots/admin-key-2.png)
3. choose CLI access and mark the choice below that you understand and want to create a access key       
     
     ![](screenshots/admin-key-3.png)
     
4. Add a Description or tag name for your access key      
     
     ![](screenshots/admin-key-4.png)

5. You should save your access key or download a .csv file before you done 
     ![](screenshots/admin-key-5.png)

#### Repeate this steps with dev user and Don"t forget to save the .csv file of access key 

![](screenshots/cli-key.png)


-------------------------------------------------------------------------------

### Finally let's log in with admin-2 and dev users with cli and run some commands

1. first you should run this command to configure access key and secret access key that created in the previous steps 
    ```sh
    aws configure
    ```
2. then enter the access key and secret access key for admin-2 and dev that we saved. 
3. Default region which i entered us-east-1. 
4. Default output in a json format or yaml as you like. 
5. Run some command don't forget that we assign adminstration access to admin-2
    ```sh
    aws iam list-users
    ```
    
    ![](screenshots/admin-2-access-cli.png)

6. Do this also to login in with dev user but dev has only s3 full access when i run this command the output is access denied.
    ```sh
    aws iam list-users
    ```
    

     ![](screenshots/cli-dev.png)
------------------------------------------------------------------------------