# Economic-API

This is a simple api made with python and flask

## Requirements

Need to have minikube and terraform installed.

If you dont know how to install them , means that this repo is not intended to you.


## Content

### api-helm directory
Contain the Helm chart inlcuding the dummy-pdf app deployment

### iac directory

Contain terraform code to deploy the helm chart to minikube

## Deployment

Just run the deploy-terraform-minikube.sh script with one of the following parameters ( are self-explanatory)
- plan
- deploy
- destroy

## Accesing the service

Simple approach is to run port-forward:

ex. 
```bash
kubectl port-forward service/api 8081:8080
```

Go to localhost:8081 with one of the following endoints:

- /stat - status
-  /[0-9] - accesing pdf file from other pod
## Exampple
```bash
deploy-terraform-minikube.sh plan
```