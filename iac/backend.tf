terraform {
  backend "local" {
    path = ".tfstate/terraform-api-economic.tfstate"
  }
}