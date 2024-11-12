##################################################################
# Reverse Proxy for Minecraft server
#
# Copyright (c) 2023-2024 kokoroq. All rights reserved.
#
#
#                 Dockerfile for rp4m
#
#
# PLEASE DO NOT EDIT
# Use with compose.yaml
#
#                                               VERSION: 1.0
##################################################################


#----------------------------------------------------------------#
#   BASE:       nginx:mainline
#   PACKAGE:    OpenJDK 21 & tmux & tzdata
#   COPY:       Minecraft Server in app dir
#----------------------------------------------------------------#

# Base image
FROM nginx:mainline

# Initialize
RUN mkdir -p /etc/nginx/org.d/; \
    mv /etc/nginx/nginx.conf /etc/nginx/org.d/;

# Copy files
COPY ./conf/nginx.conf /etc/nginx/
COPY ./conf/rp_minecraft*.conf /etc/nginx/conf.d/

# Environment
ENV LANG=C.UTF-8

# Command
CMD ["nginx", "-g", "daemon off;"]