
#!/bin/bash

### every exit != 0 fails the script

echo " *1 ------------- > INSTALL NGORK "
printenv
echo " *1 ------------- -------------------- "
echo $NGROK_TOKENS
echo "tk"
echo $V1_NGROK_TOKENS
echo "Environment_KEY_VAULT"
echo $Environment_KEY_VAULT
wget -q https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.tgz
tar xvf ngrok-stable-linux-amd64.tgz && chmod +x ngrok && cp ngrok /usr/bin/
#git clone https://github.com/GH0STAV0/SDA_ALL.git
#cp /root/install_add/geckodriver22 /usr/bin/
#export NO_VNC_HOME=/usr/share/novnc
#rm /headless/*.bz2*

#git clone https://github.com/GH0STAV0/ALL_HCL.git
#service tor restart
#apt-get autoremove --yes
#apt-get autoclean 
#apt-get autoremove --yes
#rm -rf /var/lib/apt/lists/*
#rm -rf /var/lib/{apt,dpkg,cache,log}/
clear
ngrok authtoken $NGROK_TOKENS
ngrok http 6901 > /dev/null &
export WEBHOOK_URL="$(curl http://localhost:4040/api/tunnels | jq ".tunnels[0].public_url")" && echo $WEBHOOK_URL

