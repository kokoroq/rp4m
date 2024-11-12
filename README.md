<!--
########################################################################
#  Reverse Proxy for Minecraft server
#
# Copyright (c) 2024 kokoroq. All rights reserved.
#
#
#                       README - English                      
#
#
#
#                                               VERSION: 1.0
########################################################################
-->

# Reverse Proxy for Minecraft server (RP4M)

This package is a reverse proxy tool for Minecraft.
<br>

# Requirement

### Operating System
- Linux
    - The list is confirmed OS
        - Ubuntu 22.04
        - Ubuntu 24.04

### Packages :
- Docker

[Docker](https://www.docker.com/) must be installed before running script.
> [IMPORTANT!]
> Recommend to install from Docker official repository.
<br>

# Preparation

First, write the IP address and port of the server to be forwarded in `server_list.txt`

e.g.\)
```
# Fill in the IP address and port of the server to forward to this file and the port to receive on the proxy server.
#             | IP ADDRESS:PORT (the server to be forwarded) | LISTEN PORT (This server) |
# e.g.)
#               192.168.1.10:25565 25567
192.168.1.21:25565 25570
192.168.1.22:25565 25571
```

This tool adds the following information
- Ports to listen on
- IP address and port of the server to forward

Next, launch the preparation tool to generate the proxy setting before creating the container.
```bash
./pre_configure_tool.sh
```

# Create container & Start

When the **Preparation** is finished, run the following script

```bash
./run.sh
```
<br>

# Stop & Remove

Use docker command to stop/remove

```bash
docker stop rp4m
docker rm rp4m
```

# Support

Contact: kokoroq

# License

RP4M is distributed under `MIT License`. See [LICENSE](https://github.com/kokoroq/rp4m/blob/main/LICENSE)