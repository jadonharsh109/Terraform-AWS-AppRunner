terraform {
  backend "s3" {
    bucket = "terrafrom-workdir"
    key    = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform"
  }
}
