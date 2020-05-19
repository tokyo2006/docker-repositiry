# Developer for Mock AWS S3

##  How to use this container
### Prepare your docker in windows with https://docs.docker.com/engine/installation/windows/
### In Linux
> docker run -d --name <your container name> -p <your port>:9444 tokyo2006/s3ninja 

If you want to storage your data in local please volume your folder to container

> docker run -d --name <your container name> -p <your port>:9444  -v <your local path>:/s3ninja/data tokyo2006/s3ninja 
