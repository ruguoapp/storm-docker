variable "access_key" {}

variable "secret_key" {}

variable "region" {
  default = "cn-north-1"
}

variable "ec2_instance_type" {
  default = "c4.xlarge"
}

variable "ec2_instance_ami_nimbus_type" {
  default = "ami-051fdb88ad987155e"
}

variable "ec2_instance_ami_work_type" {
  default = "ami-0ba347cb679e2adbd"
}

variable "ec2_key_name" {
  default = "spark"
}

variable "ssh_name" {
  default = "ubuntu"
}

variable "ssh_local_pem_path" {
  default = "/Users/songwei/.ssh/spark.pem"
}
