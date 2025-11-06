resource "aws_instance" "roboshop" {
    ami = data.aws_ami.rahul-practice.id
    instance_type = local.instance_type
    vpc_security_group_ids = [aws_security_group.roboshop.id]
    tags = local.ec2_tags

    provisioner "local-exec" {
        command = "echo jump server is created and public ip is ${self.public_ip}"      
    }

    connection {
      type = "ssh"
      user = "ec2-user"
      password = "DevOps321"
      host = self.public_ip
    }

    provisioner "remote-exec" {
        inline = ["sudo dnf install nginx -y", 
                   "sudo systemctl start nginx"]

    }
    provisioner "remote-exec" {
        inline = ["sudo stop nginx"]
        when = destroy #This will be performed only during destroy
        on_failure = continue #This will allow terraform to continue even if this provisioner fails to execute.
    }
    provisioner "local-exec" {
      command = "echo the jump server is destroyed"
      when = destroy
    }
    }

resource "aws_security_group" "roboshop-allow-traffic" {
    name = "roboshop-network-traffic"
    description = "allowing network through limited ports"
    dynamic "egress" {
        for_each = toset(var.network_ports)
        content {
         from_port = egress.value
         to_port = egress.value
         protocol = "tcp"
         cidr_blocks = "[0.0.0.0/0]"
        }
    }
    dynamic "ingress" {
        for_each = toset(var.network_ports)
        content {
         from_port = ingress.value
         to_port = ingress.value
         protocol = "tcp"
         cidr_blocks = "[0.0.0.0/0]"
        }
    }
    tags = local.sg_tags
}