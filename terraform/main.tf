resource "random_string" "password" {
  length           = 16
  special          = true
  override_special = "_%@"
}

output "pass" {
  value = random_string.password.result
  sensitive = false
}

resource "random_id" "server" {
  byte_length = 8
}
output "name" {
  value = random_id.server.hex
  sensitive = false
}
