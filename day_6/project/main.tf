resource "aws_instance" "s7rosine_ec2_instance" {
  ami             = "ami-0e2c8caa4b6378d8c"  # Replace with your specific AMI ID
  instance_type   = "t2.micro"
  key_name        = "terra-key"

  tags = {
    Name = "day_6"
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Hello, Terraform!' > /home/ubuntu/hello.txt"
    ]
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa")  # Corrected path
    host        = self.public_ip
  }
}
