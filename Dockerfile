FROM docker.io/library/centos:latest
RUN yum install -y nc
CMD ["nc", "-l", "-p", "1234", "-c", "echo hello daemon"]
