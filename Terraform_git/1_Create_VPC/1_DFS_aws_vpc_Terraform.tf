# ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-20180912 (ami-0d773a3b7bb2bb1c1)
#eu-west-1  
###############################

provider "aws" {
	region ="${var.region}"
	shared_credentials_file = "/home/john/.aws/credentials"
	profile                 = "john"
}


resource "aws_vpc" "dfs_VPC" {
  cidr_block       = "172.20.0.0/16"
#  instance_tenancy = "dedicated"

  tags {
    Name = "dfs_2019_10thApril_aws_vpc"
  }
}

resource "aws_subnet" "dfs_DMZ_Subnet_A_Public" {
  vpc_id     = "${aws_vpc.dfs_VPC.id}"
  cidr_block = "172.20.10.0/24"

  tags = {
    Name = "dfs_DMZ_Subnet_A_Public"
  }
}

resource "aws_subnet" "dfs_DMZ_Subnet_B_Public" {
  vpc_id     = "${aws_vpc.dfs_VPC.id}"
  cidr_block = "172.20.20.0/24"

  tags = {
    Name = "dfs_DMZ_Subnet_B_Public"
  }
}
resource "aws_subnet" "dfs_internal_Database_Subnet_A_Private" {
  vpc_id     = "${aws_vpc.dfs_VPC.id}"
  cidr_block = "172.20.30.0/24"

  tags = {
    Name = "dfs_internal_Database_Subnet_A_Private"
  }
}
resource "aws_subnet" "dfs_internal_Database_Subnet_B_Private" {
  vpc_id     = "${aws_vpc.dfs_VPC.id}"
  cidr_block = "172.20.40.0/24"

  tags = {
    Name = "dfs_internal_Database_Subnet_B_Private"
  }
}
resource "aws_subnet" "dfs_internal_Application_Subnet_A_Private" {
  vpc_id     = "${aws_vpc.dfs_VPC.id}"
  cidr_block = "172.20.50.0/24"

  tags = {
    Name = "dfs_internal_Application_Subnet_A_Private"
  }
}
resource "aws_subnet" "dfs_internal_Application_Subnet_B_Private" {
  vpc_id     = "${aws_vpc.dfs_VPC.id}"
  cidr_block = "172.20.60.0/24"

  tags = {
    Name = "dfs_internal_Application_Subnet_B_Private"
  }
}


########################



