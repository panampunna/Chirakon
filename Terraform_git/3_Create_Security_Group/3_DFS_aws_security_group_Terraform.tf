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
    DFS_Tag="dfs_VPC_2019"
}
}

########################
###  aws_security_group

resource "aws_security_group" "john_security_group_1" {
  name        = "John_Security_group_1"
  description = "description for John Security Group 1"
  vpc_id      = "${aws_vpc.dfs_VPC.id}"

  ingress {
  #  # TLS (change to whatever ports you need)
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["11.22.33.44/32", "22.33.44.55/32", "33.44.55.66/32"]
    description     = "inbound  postgresql john_security_group "
}

############Adding 1 more inbound 

 ingress {
    from_port   = 389
    to_port     = 389
    protocol    = "tcp"
    cidr_blocks = ["137.97.32.62/32", "22.33.44.55/32", "33.44.55.66/32"]
    description     = "inbound  postgresql john_security_group "
}



  egress {
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    cidr_blocks     = ["172.0.0.0/16", "22.33.44.55/32"]
    description     = "outbound postgresql john_SG1 "
  }

tags = {
    Name = "Tag_john_SG1"
  }
}

#########################################################
###  aws_security_group

resource "aws_security_group" "john_security_group_2" {
  name        = "John_Security_group_2"
  description = "description for John Security Group 2"
  vpc_id      = "${aws_vpc.dfs_VPC.id}"

  ingress {
  #  # TLS (change to whatever ports you need)
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["172.220.0.0/32", "172.20.0.0/16"]
    description     = " 80 port postgresql john_security_group"
  }

  egress {
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    cidr_blocks     = ["172.20.0.0/16"]
    description     = "egress is out bound  8080 port security_group 2"
  }

#######Adding 1 more outbound 
 egress {
    from_port       = 8081
    to_port         = 8081
    protocol        = "tcp"
    cidr_blocks     = ["172.20.0.0/16"]
    description     = "egress is out bound  8080 port security_group 2"
  }



tags = {
    Name = "Tag_john_SG_2"
    JOHN_Tag="Tag john SG2"
  }
}

#####################################################################################

