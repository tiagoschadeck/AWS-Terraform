resource "aws_key_pair" "chaves" {
  key_name = "chaves"
  public_key = var.PUBLIC_KEY_PATH
}
