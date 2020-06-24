FROM amazon/aws-cli:2.0.25

RUN sudo yum update -y \
  && sudo amazon-linux-extras install docker \
  && sudo yum install docker \
  && sudo service docker start \
  && sudo usermod -a -G docker ec2-user \
  && docker info

ADD entrypoint.sh /entrypoint.sh

RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"]