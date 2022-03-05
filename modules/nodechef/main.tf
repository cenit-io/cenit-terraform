# AMI
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

# Ec2 Userdata
# data "template_file" "userdata" {
#   template = "${file("${path.module}/userdata.sh.tpl")}"
#   #vars = {
#     #example = "xxxxxx"
#   #}
# }

# Ec2 Instance
resource "aws_instance" "nodechef" {
  depends_on = [
    aws_security_group.nodechef_sec_group
  ]
  count = var.nodechef_cluster_count
  ami   = data.aws_ami.ubuntu.id
  # user_data     = data.template_file.userdata.rendered
  subnet_id                   = element(var.subnet_ids, count.index)
  instance_type               = var.instance_type
  key_name                    = var.keypair_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.nodechef_sec_group.id]
  disable_api_termination     = var.disable_api_termination
  root_block_device {
    volume_size = var.ebs_volume_size
    volume_type = var.ebs_volume_type
  }

  tags = {
    Name    = "Nodechef Instance"
    Service = "Nodechef"
  }

  lifecycle {
    ignore_changes = [
      ami
    ]
  }
}

# Security group
resource "aws_security_group" "nodechef_sec_group" {
  depends_on = [
    aws_eip.this
  ]
  name        = "nodechef_sec_group"
  description = "Allow nodechef to connect to the database"
  vpc_id      = var.vpc_id

  ingress = [
    {
      description      = "SSH"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = concat(formatlist("%s/32", var.nat_gateway_ips), formatlist("%s/32", aws_eip.this.*.public_ip), ["145.239.6.228/32", "79.137.69.153/32", "144.217.79.166/32", "54.39.130.53/32", "45.77.76.155/32", "167.114.116.118/32", var.vpc_cidr_block])
      ipv6_cidr_blocks = null
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    },
    {
      description      = "HTTP"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = concat(formatlist("%s/32", var.nat_gateway_ips), formatlist("%s/32", aws_eip.this.*.public_ip), ["145.239.6.228/32", "79.137.69.153/32", "144.217.79.166/32", "54.39.130.53/32", "45.77.76.155/32", "167.114.116.118/32", var.vpc_cidr_block])
      ipv6_cidr_blocks = null
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    },
    {
      description      = "HTTPS"
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = concat(formatlist("%s/32", var.nat_gateway_ips), formatlist("%s/32", aws_eip.this.*.public_ip), ["145.239.6.228/32", "79.137.69.153/32", "144.217.79.166/32", "54.39.130.53/32", "45.77.76.155/32", "167.114.116.118/32", var.vpc_cidr_block])
      ipv6_cidr_blocks = null
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    },
    {
      description      = "All TCP"
      from_port        = 2330
      to_port          = 6000
      protocol         = "tcp"
      cidr_blocks      = concat(formatlist("%s/32", var.nat_gateway_ips), formatlist("%s/32", aws_eip.this.*.public_ip), ["145.239.6.228/32", "79.137.69.153/32", "144.217.79.166/32", "54.39.130.53/32", "45.77.76.155/32", "167.114.116.118/32", var.vpc_cidr_block])
      ipv6_cidr_blocks = null
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    }
  ]

  egress = [
    {
      description      = "Allow outbound traffic"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    }
  ]

  tags = {
    Name    = "nodechef_sec_group"
    Service = "Nodechef"
  }
}

#EIP
resource "aws_eip" "this" {
  count = var.nodechef_cluster_count
  #instance  = aws_instance.nodechef[count.index].id
  vpc = true
  tags = {
    "Name" = "nodechef-${count.index + 1}"
  }
}

#EIP Association
resource "aws_eip_association" "this" {
  depends_on = [
    aws_instance.nodechef
  ]
  count         = var.nodechef_cluster_count
  instance_id   = aws_instance.nodechef[count.index].id
  allocation_id = aws_eip.this[count.index].id
}