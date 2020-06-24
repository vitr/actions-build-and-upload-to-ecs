FROM amazon/aws-cli:2.0.25

RUN yum update -y \
  && amazon-linux-extras install docker \
  && yum install docker \
#  && service docker start \
#  && usermod -a -G docker ec2-user \
  && docker info

ADD entrypoint.sh /entrypoint.sh

RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"]