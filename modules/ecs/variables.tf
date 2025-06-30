variable "vpc_id" {}
variable "public_subnet_ids" {
  type = list(string)
}
variable "app_sg_id" {}
variable "db_address" {}
variable "acm_certificate_arn" {}
