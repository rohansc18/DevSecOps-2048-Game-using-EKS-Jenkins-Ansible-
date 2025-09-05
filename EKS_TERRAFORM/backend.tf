terraform {
  backend "s3" {
    bucket         = "my-tf-test-bucketxxxaxaxaxaxasasassd-ec2ech"
    region         = "us-east-1"
    key            = "EKS-DevSecOps-Tetris-Project/EKS-TF/terraform.tfstate"
    
    use_lockfile = true
  }
  
}
