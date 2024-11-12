#!/bin/bash
##################################################################
# Reverse Proxy for Minecraft server
#
# Copyright (c) 2023-2024 kokoroq. All rights reserved.
#
#
#                      Start script
#
#
# PLEASE DO NOT EDIT
#
#                                               VERSION: 1.0
##################################################################

#   VAR
VERSION="1.0"

# Check .gen_port_list
if [ ! -e ./.gen_port_list ]; then
    echo "Before running this script, please use 'pre_configure_tool.sh'"
    exit 1
fi

# Check create container
echo "[ATTENTION!!]"
echo "Before running this script, please use 'pre_configure_tool.sh'"
read -p "Do you want to create a 'Reverse Proxy' server? [y/n] > " IGNITION_INSTALL

if [[ $IGNITION_INSTALL != [yY]* ]]; then
    echo "Abort create"
    sleep 2
    exit 0
fi 

# Set port number
i=0
while read LINE
do
    PORT_NUM[${i}]="-p $LINE:$LINE"
    i=`expr $i + 1`
done < ./.gen_port_list

# Build image
echo "[BUILD] rp4m/nginx:$VERSION"
docker image build -t rp4m/nginx:$VERSION ./docker

# Run container
echo "[RUN] rp4m container"
docker container run -d --name rp4m ${PORT_NUM[@]} --restart always -v /var/log/rp4m/:/var/log/nginx/ rp4m/nginx:$VERSION

# Check container
CONTAINER_STATUS=`docker inspect --format='{{.State.Status}}' rp4m`
if [ $CONTAINER_STATUS = "running" ]; then
    echo "[COMPLETE] Running rp4m"
else
    echo "[ERROR] Not running rp4m"
fi