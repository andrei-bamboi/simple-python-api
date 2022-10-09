#!/bin/bash
set +x

cd iac

if [[ -f .terraform.lock.hcl ]]; then
  rm -f .terraform.lock.hcl
fi

if [[ -d .terraform ]]; then
  rm -rf .terraform
fi

declare "action"="$1"

case "${action}" in
  "deploy")
    terraform init
    terrafrom tain helm_release.api
    terraform apply -auto-approve
    if [ $? -ne 0 ]; then
      echo "failed"
      exit 1
    fi
    ;;
  "destroy")
    terraform init

    terraform destroy -auto-approve
    if [ $? -ne 0 ]; then
      echo "failed"
      exit 1
    fi
    ;;
  "plan")
    terraform init
    terraform plan
    if [ $? -ne 0 ]; then
      echo "failed"
      exit 1
    fi
    ;;
  *)
  echo -e "${action} action is an invalid option\nShould choose between "deploy", "plan" or "destroy" actions"
  ;;
esac

exit 0


