FROM tokyo2006/base:jdk7
LABEL maintainer="Chen Zeng <rurounikexin@gmail.com>" 

RUN yum install -y openssh-server \
    && yum install -y expect

ADD ssh_keygen.sh ssh_keygen.sh

RUN chmod a+x /ssh_keygen.sh \
    && sh ssh_keygen.sh

EXPOSE 22

ENTRYPOINT ["/usr/sbin/sshd"]
CMD ["-D"]
