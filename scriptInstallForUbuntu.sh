#! /bin/bash

echo "############################################################################################################"
echo "			     	            Olá ao script configuration do Asher :D 			"
echo "############################################################################################################"
echo " Deseja instalar os pacotes usuário?[S/n] "
read resposta



if [ "$resposta" = "S" ] || [ "$resposta" = "y" ] || [ "$resposta" = "s" ] || [ $resposta = "Y" ]; then

	sudo apt-get dist-upgrade -y

	sudo apt-get update -y
	
	sudo apt-get upgrade

	sleep 4

	sudo apt-get install curl -y

	echo "\n Curl instalado! \n"

	sleep 4

	sudo apt install net-tools -y

	echo "\n Pacote NetTools instalado! \n"

	sleep 4

	sudo apt install micro -y

	echo "\n Editor de texto Micro instalado! \n"

	sleep 4

	sudo apt install ncdu -y

	echo "\n Ncdu instalado! \n"

	sleep 4

	sudo apt install bashtop -y

	echo "\n BashTop instalado! \n"

	sleep 4

	sudo apt install git -y

	echo "\n Git instalado! \n"

	sleep 4

	sudo apt install gparted -y

	echo "\n Gparted instalado! \n"

	sleep 4

	sudo apt install virtualbox -y
	sudo apt install virtualbox-ext-pack -y

	echo "\n VirtualBox instalado! \n"

	sleep 4

	sudo apt install wine -y
	sudo apt install wine-development -y

	echo "\n Wine instalado! \n"

	sleep 4

	sudo apt install neofetch -y

	echo "\n Neofetch instalado! \n"

	sleep 4

	sudo apt install python3-venv -y
	sudo apt install python3-pip -y

	echo "\n Pacotes do Python instalado! \n"

	sleep 4

	sudo apt install snapd -y

	echo "\n Snapd instalado! \n"

	sleep 4

	sudo snap install vlc

	echo "\n Vlc instalado! \n"

	sleep 4

	sudo snap install qbittorrent-arnatious

	echo "\n QbitTorrent instalado! \n"

	sleep 4

	sudo snap install code --classic

	echo "\n Visual Studio Code instalado! \n"

	sleep 4

	sudo apt install composer -y 

	echo "\n Composer instalado! \n"

	sleep 4

	sudo apt install flatpak -y
	flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

	echo "\n Flatpak instalado! \n"

	flatpak install flathub com.discordapp.Discord

	sleep 4

	echo "\n Discord instalado! \n"

	flatpak install flathub org.telegram.desktop

	echo "\n Telegram instalado! \n"
	
	sleep 4

	flatpak install flathub com.github.micahflee.torbrowser-launcher

	echo "\n TOR instalado! \n"
	
	sleep 4

	curl -fsSL https://deb.nodesource.com/setup_19.x | sudo -E bash - &&
		sudo apt-get install -y nodejs

	echo "\n NodeJs instalado! \n"

	sleep 4

	sudo apt install alacarte -y

	echo "\n Alacarte instalado! \n"

	sleep 4

	sudo apt install zsh -y

	echo "\n Zsh instalado! \n"

	sleep 4

	sudo chsh -s /bin/zsh

	echo "\n Deseja instalar Tiling Window Manager(i3wm)?"
	read respostaI3
	if [ "$respostaI3" = "S" ] || [ "$respostaI3" = "s" ] || [ "$respostaI3" = "Y" ] || [ "$respostaI3" = "y" ]; then

		sudo apt install i3 -y
		sudo apt install i3blocks -y
		sudo apt install nautilus -y
		sudo apt install nautilus-data -y
		sudo apt install nitrogen -y
		sudo apt install cmus -y 

		echo "\n Tiling Window Manager instalado! \n"

		sleep 4

	fi

	sudo echo " #! /usr/bin/bash
	sudo apt-get update -y > /home/logsSistem/asher.txt
	sudo apt-get upgrade -y >> /home/logsSistem/asher.txt

	" >>/home/asherScript.sh

	sudo chmod 777 /home/asherScript.sh

	sudo echo "[Unit]
	Description=Service para rodar scripts após a inicialização do sistema
	After=network.target

	[Service]
	Type=simple
	ExecStart=/bin/sh /home/asherScript.sh
	TimeoutStartSec=0

	[Install]
	WantedBy=default.target 
	" >>/etc/systemd/system/asherScriptsDois.service

	sudo chmod 775 /etc/systemd/system/asherScriptsDois.service

	sudo systemctl daemon-reload
	sudo systemctl enable asherScriptsDois.service
	sudo systemctl daemon-reload
	sudo systemctl start asherScriptsDois.service

	sudo apt-get upgrade -y

	sleep 3
	echo "\n \n \n \n \n \n \n \n \n \n \n \n"
	echo "\n §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ \n 	Seu sistema está pronto para uso! \n §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ \n"

fi


