FROM docker.io/library/centos:latest
RUN yum install -y https://yum.puppetlabs.com/puppet5/puppet5-release-el-7.noarch.rpm
RUN yum install -y nc git puppet
CMD ["nc", "-l", "-p", "1234", "-c", "echo hello daemon"]
