terraform {
  backend "s3" {
    bucket = "ejahw7-teraformstatebucket"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
    use_lockfile =true
  }
}
