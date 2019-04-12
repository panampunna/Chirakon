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
    DFS_Tag="Test_vpc"
}
}

resource "aws_subnet" "dfs_DMZ_Subnet_A_Public" {
  vpc_id     = "${aws_vpc.dfs_VPC.id}"
  cidr_block = "172.20.10.0/24"

  tags = {
    Name = "dfs_DMZ_Subnet_A_Public"
    DFS_Tag="Test_dfs_DMZ_Subnet_A_Public"
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
############################################################
##john internet_gateway 


resource "aws_internet_gateway" "dfs_internet_gateway" {
  vpc_id = "${aws_vpc.dfs_VPC.id}"

  tags = {
    Name = "dfs_internet_gateway"
    DFS_Tag="DFS_IGW_2019"
}
}

########################
#john output 
output "OutPut_IGW" {
  value = "${aws_internet_gateway.dfs_internet_gateway.id}"
}

output "dfs_VPC" {
  value = ["${aws_vpc.dfs_VPC.id}"]
}


##################

resource "aws_route_table" "dfs_route_table" {
  vpc_id = "${aws_vpc.dfs_VPC.id}"

  route {
    cidr_block = "172.20.0.0/16"
    gateway_id = "${aws_internet_gateway.dfs_internet_gateway.id}"
  }


  tags = {
    Name = "dfs_route_table"
    DFS_Tag="DFS_route_table_2019"
  }
}




/*
#############################################
#####nat_gateway
resource "aws_nat_gateway" "nat_gateway-dfs_DMZ_Subnet_A_Public" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id     = "${aws_subnet.dfs_DMZ_Subnet_A_Public.id}"

  tags = {
    Name = "nat_gateway-dfs_DMZ_Subnet_A_Public"
    DFS_Tag="nat_gateway-dfs_DMZ_Subnet_A_Public_2019"
  }
}


################################################
*/ 

