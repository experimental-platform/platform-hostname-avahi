FROM experimentalplatform/ubuntu:latest


RUN apt-get update && \
    apt-get install -y build-essential curl libnss-mdns avahi-daemon avahi-utils lsof && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /var/run/dbus

ADD avahi-daemon.conf /etc/avahi/avahi-daemon.conf

CMD [ "/usr/sbin/avahi-daemon" ]
