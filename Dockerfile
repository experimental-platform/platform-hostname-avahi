FROM experimentalplatform/ubuntu:latest


RUN apt-get update && \
    apt-get install -y avahi-daemon && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /var/run/dbus

ADD avahi-daemon.conf /etc/avahi/avahi-daemon.conf

CMD [ "avahi-daemon" ]
