provider "aws" {
  region = "us-west-2"
  access_key = "AKIASAVBMPZ2POIAXD4S"
  secret_key = "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"
}
resource "aws_vpc" "new-vpc"{
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = main 
  }
}

resource "aws_subnet" "private-subnet" {
  vpc_id = data.aws_vpc.new-vpc.id
  cidr_block =  "10.0.0.1/24"
  
}




output "print_vpc_name" {
  value = aws_vpc.new-vpc.id
  
}

resource "aws_subnet" "private-subnet" {
   vpc_id = aws_vpc.new-vpc.id  # ref to created vpc id in above steps
   cidr_block = "10.0.0.16/24"
   availability_zone = "us-west-2a"

}


data "aws_vpc" "existing-vpc" {
  default = true
  
}

resource "aws_subnet" "dev-sub" {
  vpc_id = data.aws_vpc.existing-vpc.id
  cidr_block = ""
  
  
}

output "aws_subnet" {
  value = aws_subnet.dev-sub.id

}
