module "oidc_role" {
  source        = "../../../modules/iam-oidc"
  # account_id = data.aws_ssm_parameter.spot_role_assume_account_id.value
  repo_list = var.repo_list
}
