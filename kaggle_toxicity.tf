resource "aws_s3_bucket" "models" {
  bucket = "ekholabs-kaggle-models"
  acl    = "private"
}

resource "aws_instance" "kaggle_toxicity" {
  ami                         = "${var.ami}"
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.aws_key_name}"

  vpc_security_group_ids      = ["${aws_security_group.vpc_sg.id}"]
  subnet_id                   = "${aws_subnet.eu-west-1a-public.id}"
  associate_public_ip_address = true

  root_block_device {
    volume_size = 50
  }

  provisioner "file" {
    source      = "aws/model/hyperparams.json"
    destination = "/home/ubuntu/hyperparams.json"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = "${file("aws/keys/aws-kaggle-IE.pem")}"
      agent       = "false"
      timeout     = "1m"
    }
  }

  provisioner "file" {
    source      = "aws/s3/config"
    destination = "/home/ubuntu/.aws/config"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = "${file("aws/keys/aws-kaggle-IE.pem")}"
      agent       = "false"
      timeout     = "1m"
    }
  }

  provisioner "file" {
    source      = "aws/s3/credentials"
    destination = "/home/ubuntu/.aws/credentials"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = "${file("aws/keys/aws-kaggle-IE.pem")}"
      agent       = "false"
      timeout     = "1m"
    }
  }

  provisioner "remote-exec" {
    script = "scripts/prepare_instance.sh"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = "${file("aws/keys/aws-kaggle-IE.pem")}"
      agent       = "false"
      timeout     = "1m"
    }
  }
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.kaggle_toxicity.id}"
}

output "ip" {
  value = "${aws_eip.ip.public_ip}"
}
