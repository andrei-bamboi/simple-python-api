# Economic-API

This is a simple api made with python and flask

## Requirements

Need to have minikube and terraform installed.

If you dont know how to installed them , means that this repo is not intended to you.


## Content

### api-helm directory
Container the Helm chart.

### iac directory

Contain terraform code to deploy the helm chart to minikube

## Deployment

Just run the deploy-terraform-minikube.sh script with one of the following parameters ( are self-explanatory)
- plan
- deploy
- destroy

## Exampple
```bash
deploy-terraform-minikube.sh plan