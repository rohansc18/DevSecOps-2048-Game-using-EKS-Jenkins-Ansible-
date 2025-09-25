terraform {
  backend "s3" {
    bucket         = "terraform-eks-remote-backend-bucket"
    region         = "us-east-1"
    key            = "EKS-DevSecOps-Tetris-Project/EKS-TF/terraform.tfstate"
    
    use_lockfile = true
  }
  
}
