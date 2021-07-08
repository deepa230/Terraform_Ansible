variable "aws_region" {
  default = "ap-south-1"
}
variable "key_name" {
    default = "Key"
}
variable "vpc_cidr" {
    default = "172.0.0.0/24"
}
variable "subnets_cidr" {
    type = list(string)
 default = ["172.0.0.0/25" , "172.0.0.128/25"]
}
variable "availability_zones" {
    type = list(string)
    default = ["ap-south-1a" , "ap-south-1b"]
}
variable "kubernetes_ami" {
  default = "ami-0c1a7f89451184c8b"
}
variable "master_instance_type" {
  default = "t2.medium"
}
variable "worker_instance_type" {
  default = "t2.micro"
}
