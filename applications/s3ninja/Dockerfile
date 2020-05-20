FROM tokyo2006/base
LABEL maintainer="Chen Zeng <rurounikexin@gmail.com>" 
# it based jdk8u65 for developer
ADD assets /assets
RUN chmod a+x  /assets/setup.sh \
    && bash /assets/setup.sh
EXPOSE 9444
CMD /s3ninja/sirius.sh start && sleep 5 && tail -f /s3ninja/logs/stdout.txt

ENV JAVA_HOME /opt/jdk
ENV PATH ${PATH}:${JAVA_HOME}/bin

VOLUME ["/s3ninja/data"]


