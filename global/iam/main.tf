resource "aws_iam_group" "cli_team" {
  name = "cli-team"
}

resource "aws_iam_group_policy_attachment" "power_user" {
  group      = aws_iam_group.cli_team.name
  policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
}

resource "aws_iam_group_policy_attachment" "allow_password_change" {
  group      = aws_iam_group.cli_team.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_user" "cli_team" {
  for_each = var.usernames
  name     = each.value
}

resource "aws_iam_user_group_membership" "cli_team" {
  for_each = var.usernames
  user     = aws_iam_user.cli_team[each.value].name
  groups   = [aws_iam_group.cli_team.name]
}

resource "aws_iam_user_login_profile" "cli_team" {
  for_each                = var.usernames
  user                    = aws_iam_user.cli_team[each.value].name
  password_reset_required = true
}

resource "aws_iam_access_key" "cli_team" {
  for_each = var.usernames
  user     = aws_iam_user.cli_team[each.value].name
}

resource "local_sensitive_file" "password" {
  for_each = var.usernames
  content  = aws_iam_user_login_profile.cli_team[each.value].password
  filename = "${path.module}/credentials/password_${each.value}.txt"
}

resource "local_sensitive_file" "access_key_id" {
  for_each = var.usernames
  content  = aws_iam_access_key.cli_team[each.value].id
  filename = "${path.module}/credentials/access_key_id_${each.value}.txt"
}

resource "local_sensitive_file" "access_key_secret" {
  for_each = var.usernames
  content  = aws_iam_access_key.cli_team[each.value].secret
  filename = "${path.module}/credentials/secret_access_key_${each.value}.txt"
}
