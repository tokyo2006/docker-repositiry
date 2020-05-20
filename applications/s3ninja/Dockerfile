FROM openjdk:8u252-jdk-slim-buster
LABEL maintainer="Chen Zeng <rurounikexin@gmail.com>" 

ADD assets /assets
RUN chmod a+x  /assets/setup.sh \
    && bash /assets/setup.sh
EXPOSE 9444
CMD /s3ninja/sirius.sh start && sleep 5 && tail -f /s3ninja/logs/stdout.txt

VOLUME ["/s3ninja/data"]


