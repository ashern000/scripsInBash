#!/usr/bin/env bash
# ------------------------------------------------------------------------------------------------------- #
#
# 
# Script de instalação de programas para Debian, Ubuntu e KaliLinux #
# ------------------------------------------------------------------------------------------------------- #
# 
# Autor: Asher Novelli Bittencourt De Bortoli #
# Site: github.com/ashern000 #
# Manutenção: Asher Novelli Bittencourt De Bortoli #
#
# ------------------------------------------------------------------------------------------------------- #
#
# Historico: #
# Testado em bash 5.1.16 em 25/02/2023 #
# Testado em zsh 5.8.1-1 em 19/03/2023 #
# Testado nas distros: Ubuntu e Lubuntu #
# ------------------------------------------------------------------------------------------------------- #
#
# v1.0, 10/01/2022, Asher: #
# Criação do script para a facilitação de pos instalação #
#
# v1.2, 25/02/2023, Asher: #
# Melhorias no Script, tais como adicação de cores e resolução de bugs na instalação dos programas #

# ------------------------------------------- VARIÁVEIS ------------------------------------------------- #

PISCA_MENSAGEM="\033[34;1;5m"

MENSAGEM_APRESENTACAO="$PISCA_MENSAGEM#---------------------------------------------------------------------------------# \033[m \n
		  $(basename $0) - Powered by Asher
$PISCA_MENSAGEM
#---------------------------------------------------------------------------------# \033[m
"

PISCA="\033[32;1;5m"

LISTA_PROGRAMAS=( 'curl' 'net-tools' 'snapd' 'bashtop' 'micro' 'vim' 'mpg123' 'htop' 'iotop' 'lolcat' 'ncdu' 'git' 'gparted' 'virtualbox' 'virtualbox-ext-pack' 'wine' 'neofetch' 'python3-venv' 'python3-pip' )
LISTA_PROGRAMAS_SNAP=( 'qbittorrent-arnatious' 'code' 'vlc' 'gimp' )
# ------------------------------------------- EXECUÇÃO ------------------------------------------------- #

echo -e "$MENSAGEM_APRESENTACAO"

echo -e "  		    \033[44;1m atualizando os programas e repositórios \033[m"

sudo apt-get update -y > /dev/null
sudo apt-get upgrade -y > /dev/null

for i in "${LISTA_PROGRAMAS[@]}" ; do 
	sleep 1 
	[ "$i" = 'snapd' ] && $(sudo systemctl enable --now snapd apparmor)
	sudo apt install "$i" -y  
	echo -e "\n $PISCA $i \033[0m \n \n" 
done 

for i in "${LISTA_PROGRAMAS_SNAP[@]}" ; do
	sleep 1
	[ "$i" = 'code' ] && $(sudo snap install "$i" --classic)
	sudo snap install "$i"
	echo -e "\n $PISCA $i \033[0m \n \n" 
done

# Criação de script de inicialização? #
sudo echo "[Unit]
Description=Service para rodar scripts após a inicialização do sistema - Powered by Asher
Before=network.target

[Service]
Type=simple
ExecStart=/bin/sh /home/scriptUser.sh
TimeoutStartSec=0

[Install]
WantedBy=default.target" >/etc/systemd/system/scriptUser.service

sudo chmod 770 /etc/systemd/system/scriptUser.service

sudo mkdir /home/logsSystem
sudo echo "
#!/usr/bin/env bash
sudo apt update > /home/logsSystem/logScript.txt
sudo apt upgrade >> /home/logsSystem/logScript.txt
sudo apt autoremove >> /home/logsSystem/logScript.txt
sudo apt autoclean >> /home/logsSystem/logScript.txt" >/home/scriptUser.sh

sudo chmod 770 /home/scriptUser.sh

sudo systemctl daemon-reload
sudo systemctl enable scriptUser.service
sudo systemctl start scriptUser.service
sudo apt autoremove && sudo apt autoclean

sudo apt-get install \
    ca-certificates \
    curl \
    gnupg

sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo -e " \n Terminado!\n "


