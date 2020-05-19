FROM tokyo2006/server:8u65
LABEL maintainer="Chen Zeng <rurounikexin@gmail.com>" 

ENV ACTIVATOR_VERSION 1.2.7

RUN mkdir -p /home/tokyo2006/Code
RUN chown tokyo2006:restaff /home/tokyo2006/Code
RUN wget http://downloads.typesafe.com/typesafe-activator/$ACTIVATOR_VERSION/typesafe-activator-$ACTIVATOR_VERSION.zip && \
    unzip typesafe-activator-$ACTIVATOR_VERSION.zip && \
    mv activator-$ACTIVATOR_VERSION /home/tokyo2006/activator && \
    chown tokyo2006:restaff -R /home/tokyo2006/activator && \
    rm typesafe-activator-$ACTIVATOR_VERSION.zip
RUN echo "export PATH=$PATH:/home/tokyo2006/activator" >> /home/tokyo2006/.bashrc &&\
    echo "export _JAVA_OPTIONS='-Duser.home=/home/tokyo2006/Code'" >> /home/tokyo2006/.bashrc


USER tokyo2006
RUN chmod a+x /home/tokyo2006/activator
WORKDIR /home/tokyo2006
CMD ["/bin/bash"]
VOLUME "/home/tokyo2006/Code"
EXPOSE 9000
EXPOSE 9999
EXPOSE 8888
WORKDIR /home/tokyo2006/Code
