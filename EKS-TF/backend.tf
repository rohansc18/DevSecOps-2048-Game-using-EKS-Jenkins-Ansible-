terraform {
  backend "s3" {
    bucket         = "my-tf-test-bucketxxxaxaxaxaxasasassd-ec2ech"
    region         = "us-east-1"
    key            = "EKS-DevSecOps-Tetris-Project/EKS-TF/terraform.tfstate"
    
    use_lockfile = true
  }
  required_version = ">=1.5.0"
  
  required_providers {
    aws = {
      version = ">= 6.0.0"
      source  = "hashicorp/aws"
    }
  }
}
