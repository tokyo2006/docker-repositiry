#Create VM BOX
FROM centos:7
LABEL maintainer="Chen Zeng <rurounikexin@gmail.com>" 
#=======================================
# for a new server
#=======================================

ENV JAVA_VERSION_MAJOR 7
ENV JAVA_VERSION_MINOR 79
ENV JAVA_VERSION_BUILD 15
ENV JAVA_PACKAGE       jdk
RUN rpm -Uvh http://ftp.cuhk.edu.hk/pub/linux/fedora-epel/epel-release-latest-7.noarch.rpm \
    && echo "*                -       nofile          65536" >> /etc/security/limits.conf \
    && echo 'root:admin' | chpasswd \
    && touch /etc/selinux/config \
    && echo "SELINUX=disabled " >> /etc/selinux/config \
    && echo "SELINUXTYPE=targeted" >> /etc/selinux/config \
    && mkdir  /reworks \
    && yum -y install vim vi curl wget tar \
    && wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/${JAVA_PACKAGE}/${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}/${JAVA_PACKAGE}-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.rpm \
    && rpm -ivh ${JAVA_PACKAGE}-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.rpm && rm ${JAVA_PACKAGE}-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.rpm
