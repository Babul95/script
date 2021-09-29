
#user_data
data "template_file" "jenkins" {
  template = "${file("jenkins.sh")}"

}


#ec2
  resource "aws_instance" "jenkins" {
  ami           = var.ami
  instance_type = var.type
  #iam_instance_profile = "${aws_iam_instance_profile.ec2_profile.name}"
  subnet_id = var.subnet_id
  vpc_security_group_ids = [sg-0afc2cd01dc8dce43]
  key_name = test1
  user_data = data.template_file.jenkins.rendered
  tags = {
    Name = "${var.envname}-jenkins"
  }
}
