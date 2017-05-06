FROM resin/raspberrypi-node:latest
MAINTAINER Glavin Wiechert <glavin.wiechert@gmail.com>

# Install more dependencies
RUN apt-get update
RUN apt-get install -y \
  nfs-common cifs-utils \
  transmission-daemon vim

# Defines our working directory in container
WORKDIR /usr/src/app

# Configure Transmission
COPY transmission_settings.json ./
RUN usermod -a -G root debian-transmission

# Copy the application project
COPY start.sh ./

# Enable systemd init system in container
# ENV INITSYSTEM on

# Run on device
CMD ["/bin/bash", "start.sh"]