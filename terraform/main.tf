provider "aws" {
  region     = "${var.region}"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

resource "aws_instance" "storm-cluster-nimbus" {
  ami             = "${var.ec2_instance_ami_nimbus_type}"
  instance_type   = "${var.ec2_instance_type}"
  security_groups = ["default"]
  key_name        = "${var.ec2_key_name}"
  private_ip      = "172.31.30.21"

  tags {
    Name = "storm-cluster-nimbus"
  }

  provisioner "remote-exec" {
    inline = [
      "./jike-docker-build/login.sh",
      "docker pull 804775010343.dkr.ecr.cn-north-1.amazonaws.com.cn/storm-nimbus",
      "docker run -d --name nimbus -e TZ=\"Asia/Shanghai\" -e ZK_PORT_2181_TCP_ADDR=\"172.31.56.114,172.31.58.37,172.31.48.12\" -v \"/log/storm-logs:/var/log/storm\" --log-opt max-size=50m --net=host 804775010343.dkr.ecr.cn-north-1.amazonaws.com.cn/storm-nimbus",
    ]
  }

  connection {
    user        = "${var.ssh_name}"
    private_key = "${file("~/.ssh/spark.pem")}"
  }
}

resource "aws_instance" "storm-cluster-work-1" {
  ami             = "${var.ec2_instance_ami_work_type}"
  instance_type   = "${var.ec2_instance_type}"
  security_groups = ["default"]
  key_name        = "${var.ec2_key_name}"

  tags {
    Name = "storm-cluster-work-1"
  }

  provisioner "remote-exec" {
    inline = [
      "./jike-docker-build/login.sh",
      "docker pull 804775010343.dkr.ecr.cn-north-1.amazonaws.com.cn/storm-supervisor",
      "docker run -d --name supervisor -e TZ=\"Asia/Shanghai\" -e ZK_PORT_2181_TCP_ADDR=\"172.31.56.114,172.31.58.37,172.31.48.12\" -e NIMBUS_PORT_6627_TCP_ADDR=\"172.31.30.21\" -v \"/log/storm-logs:/var/log/storm\" --log-opt max-size=50m --net=host 804775010343.dkr.ecr.cn-north-1.amazonaws.com.cn/storm-supervisor",
    ]
  }

  connection {
    user        = "${var.ssh_name}"
    private_key = "${file("~/.ssh/spark.pem")}"
  }
}

resource "aws_instance" "storm-cluster-work-2" {
  ami             = "${var.ec2_instance_ami_work_type}"
  instance_type   = "${var.ec2_instance_type}"
  security_groups = ["default"]
  key_name        = "${var.ec2_key_name}"

  tags {
    Name = "storm-cluster-work-2"
  }

  provisioner "remote-exec" {
    inline = [
      "./jike-docker-build/login.sh",
      "docker pull 804775010343.dkr.ecr.cn-north-1.amazonaws.com.cn/storm-supervisor",
      "docker run -d --name supervisor -e TZ=\"Asia/Shanghai\" -e ZK_PORT_2181_TCP_ADDR=\"172.31.56.114,172.31.58.37,172.31.48.12\" -e NIMBUS_PORT_6627_TCP_ADDR=\"172.31.30.21\" -v \"/log/storm-logs:/var/log/storm\" --log-opt max-size=50m --net=host 804775010343.dkr.ecr.cn-north-1.amazonaws.com.cn/storm-supervisor",
    ]
  }

  connection {
    user        = "${var.ssh_name}"
    private_key = "${file("~/.ssh/spark.pem")}"
  }
}

resource "aws_instance" "storm-cluster-work-ui" {
  ami             = "${var.ec2_instance_ami_work_type}"
  instance_type   = "${var.ec2_instance_type}"
  security_groups = ["default", "jike-office"]
  key_name        = "${var.ec2_key_name}"

  tags {
    Name = "storm-cluster-work-ui"
  }

  provisioner "remote-exec" {
    inline = [
      "./jike-docker-build/login.sh",
      "docker pull 804775010343.dkr.ecr.cn-north-1.amazonaws.com.cn/storm-supervisor",
      "docker pull 804775010343.dkr.ecr.cn-north-1.amazonaws.com.cn/storm-ui",
      "docker run -d --name supervisor -e TZ=\"Asia/Shanghai\" -e ZK_PORT_2181_TCP_ADDR=\"172.31.56.114,172.31.58.37,172.31.48.12\" -e NIMBUS_PORT_6627_TCP_ADDR=\"172.31.30.21\" -v \"/log/storm-logs:/var/log/storm\" --log-opt max-size=50m --net=host 804775010343.dkr.ecr.cn-north-1.amazonaws.com.cn/storm-supervisor",
      "docker run -d --name storm-ui -e TZ=\"Asia/Shanghai\" -e ZK_PORT_2181_TCP_ADDR=\"172.31.56.114,172.31.58.37,172.31.48.12\" -e NIMBUS_PORT_6627_TCP_ADDR=\"172.31.30.21\" --net=host 804775010343.dkr.ecr.cn-north-1.amazonaws.com.cn/storm-ui",
    ]
  }

  connection {
    user        = "${var.ssh_name}"
    private_key = "${file("~/.ssh/spark.pem")}"
  }
}

output "ui-hostname" {
  value = "${aws_instance.storm-cluster-work-ui.public_ip}"
}
