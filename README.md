# Server Docker file

## This container based on CentOS 7

And add python 2.7,mercurial and other developer tools

Jenkins: When you want to deploy a jenkins server you can do this.

    sudo docker run -d -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):/usr/bin/docker -v /reworks/jenkins_home:/var/jenkins_home --name="jenkinsserver" -p 18080:8080 --dns 192.168.235.11 --dns 192.168.9.2 tokyo2006/jenkins`

The jenkins_home you can replace it to your local jenkins_home and then you can easy move jenkins to any place.Also you can map any port to 8080 and visit it to localhost:[your port] The dns is optional select.
