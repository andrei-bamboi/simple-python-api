param (
  [Parameter(Mandatory=$true)][string]$action
)

if ($action -eq $null) {
  Write-warning "Please specify terraform action (Ex: plan)"
  return
}

if (Test-Path -Path .\iac\.terraform.lock.hcl -PathType Leaf) {
    del .\iac\.terraform.lock.hcl -Recurse -Force -Confirm:$false
}

if (Test-Path -Path .\iac\.terraform) {
    del .\iac\.terraform -Recurse -Force -Confirm:$false
}

if ($action -eq "apply") {
    cd .\iac  
    terraform init
    terraform taint helm_release.api
    terraform apply -auto-approve
} elseif ($action -eq "destroy") {
    cd .\iac
    terraform init
    terraform destroy -auto-approve
} elseif ($action -eq "plan") {
    cd .\iac
    terraform init
    terraform plan
} else {
  "!!! $action is not a valid action !!!"
  exit 1
}

cd ..