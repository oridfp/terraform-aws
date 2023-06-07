provider "aws" {
    region = "us-east-1"
}

terraform {
  cloud {
    organization = "fullpath"

    workspaces {
      name = "fullpath"
    }
  }
}