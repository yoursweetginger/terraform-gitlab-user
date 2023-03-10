locals {
  users = csvdecode(file(var.users_csv_path))
}


resource "gitlab_user" "user" {
  count = length(local.users)
  name             = "${local.users[count.index].last_name} ${local.users[count.index].first_name} ${local.users[count.index].surname}"
  username         = local.users[count.index].login
  email            = local.users[count.index].email
  reset_password = true
}

resource "gitlab_group" "group" {
  for_each = toset(
    [for i in local.users : i.group]
  )
  name        = each.key
  path        = each.key
  visibility_level = "internal"
}

# resource "gitlab_group_membership" "group_membership" {
#   count = length(gitlab_user.user)
#   group_id     = "12345"
#   user_id      = gitlab_user.user[count.index].id
#   access_level = "developer"

#   depends_on = [
#     gitlab_user.users,
#     gitlab_group.groups
#   ]
# }