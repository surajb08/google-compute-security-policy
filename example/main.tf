module "policy_test" {
  source = "../"
  rules  = var.rules
  env    = "dev"
  name   = "wafpolicy"
}
