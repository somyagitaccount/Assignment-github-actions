terraform {
  backend "s3" {
    bucket         = "somya-employee-008"
    key            = "eks-cluster/terraform.tfstate"
    dynamodb_table = "terraform-lock-table"
  }
}
