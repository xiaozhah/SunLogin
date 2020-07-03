FROM consol/centos-xfce-vnc
MAINTAINER Zhou Xiao

ENV REFRESHED_AT 2018-03-18

# Switch to root user to install additional software
USER 0

ENV SunLogin_PORT=30080
EXPOSE $SunLogin_PORT

## Install software
RUN yum update && \
    yum install -y htop && \
    yum clean all && \
    wget http://download.oray.com/sunlogin/linux/SunloginClient-10.0.2.24779_amd64.deb && \
    tar xzvf SunloginClient-10.0.2.24779_amd64.deb && \
    cd sunloginclient && \
    ./run.sh
    
## switch back to default user
USER 1000
