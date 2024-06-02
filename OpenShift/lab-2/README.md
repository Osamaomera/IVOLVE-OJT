# MySQL StatefulSet and Service Setup in Kubernetes

This guide will walk you through the process of setting up a MySQL StatefulSet with persistent storage and defining a headless Service for accessing the StatefulSet pods in Kubernetes.

Let's first compare Deployments and StatefulSets in Kubernetes:

### Comparison: Deployment vs StatefulSet

| Feature                 | Deployment                                       | StatefulSet                                              |
|-------------------------|--------------------------------------------------|----------------------------------------------------------|
| Pod Management          | Manages stateless pods with unique names         | Manages stateful pods with stable, unique identities     |
| Pod Order and Identity  | Pods are typically interchangeable and can scale | Pods have stable identities, ordinal numbering, and are not interchangeable |
| Storage Management      | Suitable for stateless applications              | Suitable for stateful applications with persistent data  |
| Scaling                 | Supports horizontal scaling easily               | Supports both horizontal and vertical scaling            |
| Updates and Rollbacks   | Supports rolling updates and rollbacks           | Supports rolling updates, but with considerations for statefulness |
| Network Identity        | Pods get a random hostname and IP                | Pods get a stable hostname and IP                       |

Now, let's create a YAML file for configuring a MySQL StatefulSet and defining a Service for it.

## Prerequisites

- Access to a Kubernetes cluster
- `kubectl` CLI installed and configured
- Basic knowledge of Kubernetes concepts

## MySQL StatefulSet YAML Configuration

```yaml
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: mysql-statefulset
spec:
  serviceName: mysql
  replicas: 3
  selector:
    matchLabels:
      app: mysql
  template:
    metadata:
      labels:
        app: mysql
    spec:
      containers:
      - name: mysql
        image: mysql:5.7
        ports:
        - containerPort: 3306
        env:
        - name: MYSQL_ROOT_PASSWORD
          value: "your-root-password"
        volumeMounts:
        - name: mysql-data
          mountPath: /var/lib/mysql
  volumeClaimTemplates:
  - metadata:
      name: mysql-data
    spec:
      accessModes: [ "ReadWriteOnce" ]
      storageClassName: "standard"
      resources:
        requests:
          storage: 10Gi
```

This YAML file creates a StatefulSet named `mysql-statefulset` with 3 replicas. It uses the MySQL 5.7 image, sets the root password, and mounts a persistent volume for data storage.

## Service Definition for MySQL StatefulSet

```yaml
apiVersion: v1
kind: Service
metadata:
  name: mysql-service
spec:
  selector:
    app: mysql
  ports:
  - protocol: TCP
    port: 3306
    targetPort: 3306
  clusterIP: None
```

This YAML file defines a headless service named `mysql-service` for the MySQL StatefulSet. It selects pods with the label `app: mysql` and exposes port 3306.

## Steps to Apply the YAML Files

1. **Create the StatefulSet**:
   Save the MySQL StatefulSet YAML configuration to a file named `mysql-statefulset.yaml` and apply it:
   ```sh
   oc apply -f MYSQL-statefulset.yml
   ```

2. **Verify the StatefulSet and Service**:
   Check the StatefulSet and Service to ensure they are created successfully:
   ```sh
   oc get statefulsets
   oc get services
   ```

These steps will create a MySQL StatefulSet with a persistent volume for data storage and a headless service to access the StatefulSet pods.

### Screenshots

