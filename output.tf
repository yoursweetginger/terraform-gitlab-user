output "users" {
  value = gitlab_user.user
  sensitive = true
}
output "gitlab_groups" {
  value = gitlab_group.group
  sensitive = true
}
