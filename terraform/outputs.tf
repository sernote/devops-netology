# AWS account ID
output "account_id" {
  value = data.aws_caller_identity.current.account_id
}
# AWS user ID
output "user_id" {
  value = data.aws_caller_identity.current.user_id
}
# AWS регион, который используется в данный момент
output "region" {
  value = data.aws_region.current.name
}
# Приватный IP ec2 инстанса
output "private_ip" {
  value = aws_instance.web.private_ip
}
# Идентификатор подсети в которой создан инстанс
output "subnet" {
  value = aws_instance.web.subnet_id
}