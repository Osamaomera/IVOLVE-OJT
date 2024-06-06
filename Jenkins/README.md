# OpenShift Deployment using Master slave jenkins

## Architecture

1. Jenkins Master: Orchestrates the pipeline.
2. Jenkins Slave: Executes the build and push tasks.
3. Docker Hub: Hosts the Docker images.
4. OpenShift: Deploys the application in the osamaayman namespace (optinal).


## Prerequisites
Before you begin, ensure you have the following:

1. Jenkins Master and Slave setup
2. Docker installed on Jenkins Slave
3. Docker Hub account
4. OpenShift cluster with access to the osamaayman namespace
5. Jenkins Shared Library
6. kubectl installed on Jenkins Slave

## Pipeline Workflow

1. Checkout Code: Jenkins Master checks out the code from the repository.
2. Build Docker Image: Jenkins Slave builds the Docker image.
3. Push Docker Image: The image is pushed to Docker Hub.
4. Deploy to OpenShift: The new image is deployed to the OpenShift cluster.

## Setup Instructions
### Jenkins Configuration

1. Set up Jenkins Master-Slave Configuration:
    - Configure Jenkins Master to communicate with Jenkins Slave. Ensure the Slave has Docker installed and properly configured.
    - Add the Slave node in Jenkins: Manage Jenkins > Manage Nodes > New Node.
    - creating slave in EC2 in aws

![alt text](screenshots/1.png)
    
- using ssh connection between master and slave 
    
![alt text](screenshots/slave-success3.png)


2. Configure Jenkins Shared Library:
    - In Jenkins, navigate to Manage Jenkins > Configure System.
    - Scroll down to the Global Pipeline Libraries section.
    - Add a new library with the following details:
        - Name: shared-library
        - Default version: master (or the branch you want to use)
        - Retrieval method: Modern SCM
        - Source Code Management: Git
        - Project Repository: URL to your shared library repository.

3. Create a Jenkinsfile:

    1. Add a Jenkinsfile to your project repository with the following content:

```groovy
@Library('java-sharedlibrary') _
// @Library('github.com/Osamaomera/shared_library') _
pipeline {

    agent { label 'slave1' }
    // agent any 

    environment {
        dockerHubCredentialsID	    = 'DockerHub'  		    			// DockerHub credentials ID.
        imageName   		    = 'osayman74/java-app'     			// DockerHub repo/image name.
        openshiftcredintialsID  = 'openshift'
        OPENSHIFT_PROJECT = 'osamaayman'
    }
    


    stages {       

        stage('Test') {
            steps {
                script {
                    dir('Jenkins'){
                        dir('app-master'){   
                	    echo "Running Unit Test..."
			            // sh 'chmod 744 ./gradlew'
			            // sh './gradlew clean test'
                        }
                    }
        	    }
    	    }
	}
	
       
        stage('Build and Push Docker Image') {
            steps {
                script {
                	// Navigate to the directory contains Dockerfile
                 	dir('Jenkins') {
                        dir('app-master') {
                 		    buildandPushDockerImage("${dockerHubCredentialsID}", "${imageName}")
                    }
                }
            }
	    }
    }       
        
	stage('Deploy on OpenShift cluster') {
            steps {
                script {
        		// Navigate to the directory contains Deployment and Service YAML files
                    dir('Jenkins'){
                        dir('openshift'){
                            deployOnOpenShift("${openshiftcredintialsID}" , "${imageName}")
                        }
                    }

                }
            }
        }

    }

    post {
        success {
            echo "${JOB_NAME}-${BUILD_NUMBER} pipeline succeeded"
        }
        failure {
            echo "${JOB_NAME}-${BUILD_NUMBER} pipeline failed"
        }
    }
}


```
## the image after ppushing in DockerHub

![alt text](screenshots/image.png)


### Jenkins Shared Library
Create the following Groovy scripts in your shared library:
my custem Shared Library you will find i there

```
https://github.com/Osamaomera/shared-library-java-app
```

- buildAndPush.groovy:

![alt text](screenshots/build-groovy.png)

### OpenShift Deployment Configuration
Create a DeplymentAndSvc.yml file for your OpenShift cluster with the following content:

```yaml

apiVersion: apps/v1
kind: Deployment
metadata:
  name: java-deployment
spec:
  replicas: 3  # Specify the number of replicas if you want more than one pod
  selector:
    matchLabels:
      app: java-deployment
  template:
    metadata:
      labels:
        app: java-deployment
    spec:
      containers:
      - name: java-app
        image: osayman74/java-app:latest
        ports:
        - containerPort: 8081

---
apiVersion: v1
kind: Service
metadata:
  name: java-service
spec:
  type: LoadBalancer
  selector:
    app: java-deployment
  ports:
  - protocl: TCP
    port: 8081
    targetPort: 8081
```

- Apply the deployment configuration to your OpenShift cluster:

```bash
oc apply -f java-deployment-service.yml
```
- then create a service account for jenkins to can access cluster 

```bash
oc create serviceaccount jenkins -n osamaayman
```
![alt text](screenshots/login-serviceaccount.png)

Create a RoleAndRolebinding.yml file for your OpenShift cluster with the following content:

```yaml

apiVersion: v1
kind: ServiceAccount
metadata:
  name: jenkins
  namespace: osamaayman

---
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: jenkins-role
  namespace: osamaayman
rules:
- apiGroups: [""]
  resources: ["pods", "services", "deployments"]
  verbs: ["get", "list", "watch", "create", "update", "delete"]

---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: jenkins-rolebinding
  namespace: osamaayman
subjects:
- kind: ServiceAccount
  name: jenkins
  namespace: osamaayman
roleRef:
  kind: Role
  name: jenkins-role
  apiGroup: rbac.authorization.k8s.io

```
then apply 

```sh
oc apply -f role-rolebinding.yml
```

## THE PIPELINE FINAL STAGES

![alt text](screenshots/success-stages.png)

## THE FINAL WEBSITE AFTER DEPLOYED IN CLUSTER 


## Troubleshooting
### Common Issues

- Jenkins Slave Not Connecting:
    - Ensure the Slave node has the correct IP and port configurations.
    - Verify that the Slave has Docker installed and properly configured.

- Docker Build Fails:
    - Check the Dockerfile for syntax errors.
    - Ensure all dependencies are available and paths are correct.

- Push to Docker Hub Fails:
    - Verify Docker Hub credentials in Jenkins.
    - Ensure the Docker Hub repository exists and you have push access.
## Logs and Diagnostics

- Check Jenkins build logs for detailed error messages.
- Use docker logs on the Jenkins Slave to debug Docker issues.
- Use oc logs on OpenShift to diagnose deployment problems.