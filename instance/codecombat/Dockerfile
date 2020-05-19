FROM ubuntu:20.04
LABEL maintainer="Chen Zeng <rurounikexin@gmail.com>" 
ADD docker-entrypoint.sh /entrypoint.sh
RUN chmod 755 -R /entrypoint.sh
EXPOSE 3000

CMD ["/entrypoint.sh"]