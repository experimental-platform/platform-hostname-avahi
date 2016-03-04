FROM experimentalplatform/ubuntu:latest


RUN apt-get update && \
    apt-get install -y avahi-daemon && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /var/run/dbus

COPY ssh.service /etc/avahi/services/ssh.service
COPY http.service /etc/avahi/services/http.service
COPY afp.service /etc/avahi/services/afp.service
COPY tm.service /etc/avahi/services/tm.service
COPY smb.service /etc/avahi/services/smb.service
COPY dav.service /etc/avahi/services/dav.service
COPY avahi-daemon.conf /etc/avahi/avahi-daemon.conf

COPY entrypoint.sh /entrypoint.sh

CMD [ "/entrypoint.sh" ]
