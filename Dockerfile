#FROM quay.io/cata0nana/oc_v1_img:latest
FROM ubuntu:latest
ENV DISPLAY=:1 \
    NGROK_TOKENS=257VWvy4O16qLnlACoOGlAu69zH_4aaxZwYFpd7YxxeN6RY4W

ENV HOME=/root \
    TERM=xterm \
    STARTUPDIR=/dockerstartup \
    VNC_VIEW_ONLY=false


COPY ./inns/* "${STARTUPDIR}"/
RUN find $STARTUPDIR -name '*.sh' -exec chmod a+x {} +



RUN apt update && apt install  openssh-server jq sudo curl -y

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 test 
RUN ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519

RUN  echo 'root:root' | chpasswd
USER root
RUN service ssh start
RUN $STARTUPDIR/ng.sh

EXPOSE 22
#CMD ["/usr/sbin/sshd","-D"]
#CMD ["/bin/sleep", "3650d"]
COPY ./inns/ah.sh /usr/bin/
RUN chmod +x /usr/bin/ah.sh
ENTRYPOINT ["ah.sh"]

