#!/bin/sh
set -x -e
# The Dockerfile and all required config files have been created,
# now we can build a new docker image based on Ubuntu 16.04
# and our dockerfile with the docker command below
docker build -t nginx_image .

# When the command completed successfully,
# we can check the new image 'nginx_image' with the docker command below:
docker images

# Then we can try to create a new container based on nginx_images.
# And before create new container, we can create new directory
# on the host machine for the webroot data.
mkdir -p /tmp/webroot

# Now run the new container with command below:
docker run -d -v /tmp/webroot:/var/www/html -p 80:80 --name hakase nginx_image

# Then we can check that the new container with name hakase
# based on 'nginx_image' is running:
docker ps
