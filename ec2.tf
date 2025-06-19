resource "aws_instance" "expenseapp"{
    ami           = "ami-09c813fb71547fc4f" 
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.expenseapp.id]
    root_block_device {
        volume_size = 50
        volume_type = "gp3"
    }
    user_data = file("docker.sh")
    tags = {
        Name = "ExpenseApp"
    }
}

resource "aws_security_group" "expenseapp" {
    name        = "expenseapp"
    description = "Security group for Expense App"
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}