#config.tf
#eu-west-1a eu-west-1b eu-west-1c

#################################################################
# just an example
variable "region" {
  type        = "string"
  default     = "eu-west-1"   #eu-west-1 
}

variable "zones" {
	type        = "list"
	default = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}

# just an example
variable "ami" {
  type        = "string"
  description = "AMI Amazone  machine image"
 default     = "ami-0d773a3b7bb2bb1c1"
}

# just an example
variable "instance_type" {
  type        = "string"
  description = " DFS instance_type"
  default     = "t2.micro"
}



#######################################################
/*

+ aws_instance.web
      id:                           <computed>
      ami:                          "ami-0d773a3b7bb2bb1c1"
      arn:                          <computed>
      associate_public_ip_address:  <computed>
      availability_zone:            "ap-south-1"
      cpu_core_count:               <computed>
      cpu_threads_per_core:         <computed>
      ebs_block_device.#:           <computed>
      ephemeral_block_device.#:     <computed>
      get_password_data:            "false"
      instance_state:               <computed>
      instance_type:                "t2.micro"
      ipv6_address_count:           <computed>
      ipv6_addresses.#:             <computed>
      key_name:                     <computed>
      network_interface.#:          <computed>
      network_interface_id:         <computed>
      password_data:                <computed>
      placement_group:              <computed>
      primary_network_interface_id: <computed>
      private_dns:                  <computed>
      private_ip:                   <computed>
      public_dns:                   <computed>
      public_ip:                    <computed>
      root_block_device.#:          <computed>
      security_groups.#:            <computed>
      source_dest_check:            "true"
      subnet_id:                    <computed>
      tags.%:                       "1"
      tags.Name:                    "DFS AWS 1st terraform  HelloWorld"
      tenancy:                      <computed>
      volume_tags.%:                <computed>
      vpc_security_group_ids.#:     <computed>



*/

