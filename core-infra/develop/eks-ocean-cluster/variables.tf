locals {
  environment   = basename(dirname(path.cwd))
  config_name = basename(dirname(dirname(path.cwd)))
  account_id    = data.aws_caller_identity.current.account_id
  
  spotinst_act  =data.aws_ssm_parameter.spotinst_account.value

  application  = "gitops"
  cluster_name = "${local.config_name}-${local.environment}-${local.application}-cluster"
  k8s_namespace = "${local.config_name}-${local.environment}"

  role_arn_to_assume = "arn:aws:iam::${local.account_id}:role/EKS-Full-Access-Role"

  map_roles =  [
    {
      rolearn  = local.role_arn_to_assume
      username = "EKS-Full-Access-Role"
      groups   = ["system:masters"]
    }
  ]
}

variable "cluster_version" {
  default = "1.21"
}

variable "kubectl_version" {
  default = "1.21.2"
}

variable "region" {
  type        = string
  description = "The region the EKS cluster will be located"
  default = "eu-west-1"
}

variable "min_size" {
  type        = number
  description = "The lower limit of worker nodes the Ocean cluster can scale down to"
  default = 1
}

variable "max_size" {
  type        = number
  description = "The upper limit of worker nodes the Ocean cluster can scale up to"
  default = 5
}

variable "desired_capacity" {
  type        = number
  description = "The number of worker nodes to launch and maintain in the Ocean cluster"
  default = 1
}

variable "workers_managed_policies" {
  default = [
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
    "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess",
    "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess",
  ]
}

variable "whitelist_ec2_types" {
  type = list(string)
  default = ["r4.large"]
}
