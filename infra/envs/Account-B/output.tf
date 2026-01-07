output "alb_url" {
  value = "http://${module.alb.alb_dns_name}"
}

output "github_actions_role_arn" {
  value = module.iam_github.github_role_arn
}