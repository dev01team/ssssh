FROM ubuntu:latest
ENV DISPLAY=:1 \
    NGROK_TOKENS=257VWvy4O16qLnlACoOGlAu69zH_4aaxZwYFpd7YxxeN6RY4W

ENV HOME=/headless \
    TERM=xterm \
    STARTUPDIR=/dockerstartup \
    VNC_VIEW_ONLY=false


COPY ./inns/* "${STARTUPDIR}"/
RUN find $STARTUPDIR -name '*.sh' -exec chmod a+x {} +



RUN apt update && apt install  openssh-server jq sudo curl -y

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 test 

RUN  echo 'test:test' | chpasswd
USER root
RUN service ssh start
RUN $STARTUPDIR/ng.sh

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
