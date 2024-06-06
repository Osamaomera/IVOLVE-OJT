# ArgoCD and ELK Deployment

This repository contains manifests and scripts for deploying ArgoCD and the ELK stack on Kubernetes and OpenShift clusters.

## Table of Contents

- [K8s](#kubernetes)
  - [Nginx App](K8s/nginx-app.yml)
  - [Elastic Search](K8s/elasticsearch.yml) 
  - [Kibana](K8s/kibana.yml)
- [OC](#openshift)
  - [ArgoCD Instance](OC/argocd-instance.yml)
  - [Elastic Search](OC/elasticsearch.yml) 
  - [Kibana](OC/kibana.yml)

## Kubernetes

- [ArgoCD](k8s/argocd): Contains YAML files and scripts for deploying ArgoCD on a Kubernetes cluster.
- [ELK](k8s/elk): Contains YAML files and scripts for deploying the ELK stack on a Kubernetes cluster.

## OpenShift

- [ArgoCD](oc/argocd): Contains YAML files and scripts for deploying ArgoCD on an OpenShift cluster.
- [ELK](oc/elk): Contains YAML files and scripts for deploying the ELK stack on an OpenShift cluster.
