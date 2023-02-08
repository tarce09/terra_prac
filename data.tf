data "aws_vpc" "new_data" {
    tags = {
        Name = "newvpc"
    }
}
/*
data "aws_subnets" "all" {
  vpc_id = "data.aws_vpc.new_data.id"
}

output "aws_subnets" {
  value = "data.aws_subnets.all.ids"
}*/

data "aws_subnet" "selected" {
    vpc_id = data.aws_vpc.new_data.id
    tags = {
        Name = "newsubnet1"
    }
}