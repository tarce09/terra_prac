resource "aws_instance" "multiple_ins" {
  #count = length(var.names)
  for_each = toset(var.names)
  instance_type = "t2.micro"
  ami           = "ami-2757f631"
  tags = {
    #Name = var.names[count.index]
    Name = each.value
  }
}

module "new_mod_2" {
  source = "github.com/tarce09/terra_prac/new_mod"
}
