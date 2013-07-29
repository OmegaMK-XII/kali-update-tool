#!/bin/sh
# Autor: OmegaMK-XII AW
# Julho 2013
#
# Script para instalação de algumas ferramentas extras no Kali Linux
# gc.omega.mk.xii [at] gmail [dot] com

VERDE="\033[1;32m"
AMARELO="\033[1;33m"
VERMELHO="\033[0;31m"
CIANO="\033[1;36m"
FIMCOR="\033[0m"

logo()
{
	clear
	echo $VERDE"====================================================================="
	echo " _  __     _ _   _   _           _       _         _____           _ "
	echo "| |/ /__ _| (_) | | | |_ __   __| | __ _| |_ ___  |_   _|__   ___ | |"
	echo "| ' // _\` | | | | | | | '_ \ / _\` |/ _\` | __/ _ \   | |/ _ \ / _ \| |"
	echo "| . \ (_| | | | | |_| | |_) | (_| | (_| | ||  __/   | | (_) | (_) | |"
	echo "|_|\_\__,_|_|_|  \___/| .__/ \__,_|\__,_|\__\___|   |_|\___/ \___/|_|"
	echo "                      |_|                                            "
	echo "====================================================================="$FIMCOR
	echo "                                          By OmegaMK-XII - versão 0.1"
	echo ""
}

menu()
{
	logo
	echo $AMARELO"Menu Principal"$FIMCOR
	echo ""$CIANO
	echo "1. Instalar pacotes extras"
	echo "2. Limpar cache de pacotes"
	echo "3. Ver informações do Sistema"
	echo "4. Atualizar Sistema (Recomendado caso seja a primeira execução)"
	echo "5. IP Scanner"
	echo "0. Sair"
	echo ""$VERMELHO
	read -p "Opção: " op
	if [ "$op" -eq "1" ]
	then
		clear
		echo $AMARELO"Pacotes Extras:"
		echo ""
		echo $VERDE"[-] De uso comum diário:"$FIMCOR
		echo ""
		echo "[1] Plugin Flashplayer			[6] Navegador Chromium"
		echo "[2] Gimp (Editor de Imagens)		[7] Skype"
		echo "[3] Compactação (rar, 7zip, etc)	[8] qBittorrent"
		echo "[4] Rhythmbox (Músicas)			[9] Java"
		echo "[5] LibreOffice				[10] Todos de uso comum"
		echo ""
		echo $VERDE"[-] Programação:"$FIMCOR
		echo ""
		echo "[11] Eclipse (Java)			[13] Codeblocks (C C++)"
		echo "[12] Idle (Python)			[20] Todos de Programação"
		echo ""
		echo $VERDE"[-] Ferramentas: "$FIMCOR
		echo ""
		echo "[21] Virtualbox				[24] Subterfuge"
		echo "[22] Tor				[25] Ghost-Phisher"
		echo "[23] Graphical Network Simulator for Multiple Networks"
		echo "[30] Todos de Ferramentas"
		echo ""
		echo $VERDE"[-] Outros:"$FIMCOR
		echo ""
		echo "[31] Synaptic (Gerênciador de Pacotes)	[34] Lynx (Navegador em Modo Texto)"
		echo "[32] Gnome Tweak Tool			[35] Filezilla (Cliente Ftp)"
		echo "[33] Xchat (Cliente irc)		[36] Raidcall"
		echo "[40] Todos de Outros"
		echo ""
		echo ""
		echo "[99] Todos				[0] Nenhum"
		echo ""$VERMELHO
		read -p "Opção: " opc

		echo $AMARELO"Instalando..."
		echo ""$FIMCOR
		case $opc in
			"1")
				apt-get -y install flashplugin-nonfree
				;;
			"2")
				apt-get -y install gimp
				;;
			"3")
				apt-get -y install alien arj zip unzip unace unace-nonfree rar unrar bzip2 tar gzip cabextract file-roller p7zip-full p7zip-rar p7zip lzip lzop ncompress unalz unp zoo xz-utils
				;;
			"4")
				apt-get -y install rhythmbox 
				;;
			"5")
				apt-get -y install libreoffice libreoffice-help-pt-br libreoffice-l10n-pt-br
				;;
			"6")
				apt-get -y install chromium-browser 
				;;
			"8")
				apt-get -y install qbittorrent 
				;;
			"7")
				wget -c "http://download.skype.com/linux/skype-debian_4.2.0.11-1_i386.deb"
				arq=`uname -m`
				if [ "$arq" = "amd64" ] || [ "$arq" = "x86_64" ]
				then
					echo ""
					echo $AMARELO"Seu sistema é 64 bits. Obtendo multi-arquitetura..."$FIMCOR
					echo ""
					dpkg --add-architecture i386
					apt-get update
				fi
				dpkg -i skype-debian_4.2.0.11-1_i386.deb
				apt-get -f install
				rm skype-debian_4.2.0.11-1_i386.deb
				;;
			"9")
				apt-get -y install default-jre
				;;
			"10")
				echo $AMARELO"Skype deve ser instalado em separado."$FIMCOR
				apt-get -y install flashplugin-nonfree gimp alien arj zip unzip unace unace-nonfree rar unrar bzip2 tar gzip cabextract file-roller p7zip-full p7zip-rar p7zip lzip lzop ncompress unalz unp zoo xz-utils rhythmbox libreoffice chromium-browser qbittorrent default-jre
				;;
			"11")
				apt-get -y install eclipse 
				;;
			"12")
				apt-get -y install idle
				;;
			"13")
				apt-get -y install build-essential codeblocks 
				;;
			"20")	apt-get -y install eclipse idle build-essential codeblocks
				;;
			"21")		
				apt-get -y install virtualbox
				;;
			"22")
				apt-get -y install tor vidalia
				;;
			"23")
				apt-get -y install gns3
				;;
			"24")
				subterfuge
				;;
			"25")
				ghost
				;;
			"30")
				apt-get -y install virtualbox tor vidalia gns3
				subterfuge
				ghost
				;;
			"31")
				apt-get -y install synaptic 
				;;
			"32")
				apt-get -y install gnome-tweak-tool
				;;
			"33")
				apt-get -y install xchat
				;;
			"34")
				apt-get -y install lynx
				;;
			"35")
				apt-get -y install filezilla
				;;
			"36")
				echo ""
				echo $AMARELO"A instalação do Raidcall será feita manualmente via wine."$FIMCOR
				echo ""
				sleep 2
				raidcall
				;;
			"40")
				echo $AMARELO"Raidcall deve ser instalado em separado."$FIMCOR
				apt-get -y install synaptic gnome-tweal-tool xchat lynx filezilla
				;;
			"99")
				apt-get -y install flashplugin-nonfree gimp alien arj zip unzip unace unace-nonfree rar unrar bzip2 tar gzip cabextract file-roller p7zip-full p7zip-rar p7zip lzip lzop ncompress unalz unp zoo xz-utils rhythmbox libreoffice chromium-browser qbittorrent default-jre
				apt-get -y install eclipse idle build-essential codeblocks
				apt-get -y install virtualbox tor vidalia gns3
				subterfuge
				ghost
				apt-get -y install synaptic gnome-tweal-tool xchat lynx filezilla
				;;
			"0")
				echo $AMARELO"Nada a ser instalado."$FIMCOR
				;;
			"")
				echo $AMARELO"Nada a ser instalado."$FIMCOR
				;;
		esac
		echo ""$AMARELO
		echo "Pronto"
		echo ""
		read -p "Aperte [ENTER] para voltar ao Menu Principal" enter
	elif [ "$op" -eq "2" ]
	then
		logo
		echo $AMARELO"Limpando cache..."$FIMCOR
		echo ""
		apt-get autoremove -y
		apt-get clean
		echo ""
		echo $AMARELO"Pronto"
		echo ""
		read -p "Aperte [ENTER] para voltar ao Menu Principal" enter
	elif [ "$op" -eq "3" ]
	then
		logo
		echo "Sistema:"
		echo ""
		ip=`curl -s ifconfig.me`
		u=`uptime`
		h=`hostname`
		k=`uname -r`
		arq=`uname -m`
		ul=`last`
		esp=`df -h | grep rootfs`
		t=`echo $esp | awk -F ' ' '{print $2}'`
		d=`echo $esp | awk -F ' ' '{print $4}'`
		up=`echo $u | awk -F ' ' '{print $3}'`
		ulti=`echo $ul | awk -F ' ' '{print $4" "$5" "$6" "$7}'`
		memoria=`cat /proc/meminfo | grep "MemTotal" | awk -F ' ' '{$1="";print}'`
		modelo=`cat /proc/cpuinfo | grep -m 1 "model name" | awk -F ':' '{print $2}'`
		date
		echo "Tempo ligado: $up			Último Login: $ulti"
		echo ""
		echo "Kernel: $k		Arquitetura: $arq"
		echo "Memória: $memoria			Modelo: $modelo"
		echo "Nome da máquina: $h		IP: $ip"
		echo "Espaço Total: $t			Espaço Disponível: $d"
		echo ""$AMARELO
		read -p "Aperte [ENTER] para voltar ao Menu Principal" enter
	elif [ "$op" -eq "4" ]
	then
		logo
		echo $AMARELO"Necessito atualizar os repositórios. Recomendo que o faça."$VERMELHO
		read -p "Permite? [s/N]: " opcao
		if [ "$opcao" = "s" ] || [ "$opcao" = "S" ]
		then
			rm /etc/apt/sources.list
			echo "deb http://security.kali.org/kali-security kali/updates main contrib non-free" >> /etc/apt/sources.list
			echo "deb http://http.kali.org/kali kali main contrib non-free" >> /etc/apt/sources.list
			echo "deb http://http.kali.org/kali kali-dev main contrib non-free" >> /etc/apt/sources.list
			echo "deb http://repo.kali.org/kali kali-bleeding-edge main" >> /etc/apt/sources.list
			echo ""
			echo $AMARELO"Atualizando repositórios..."$FIMCOR
			echo ""
			apt-get update
			echo ""
			echo $AMARELO"Repositórios atualizados."$FIMCOR
			sleep 1
		else
			echo ""
			echo $AMARELO"Os repositórios não foram atualizados."$FIMCOR
			sleep 1
		fi
		logo
		echo $AMARELO"Atualizar o Sistema."$VERMELHO
		read -p "Permite? [s/N]: " opcao
		if [ "$opcao" = "s" ] || [ "$opcao" = "S" ]
		then
			echo ""
			echo $AMARELO"Atualizando sistema..."$FIMCOR
			echo ""
			apt-get upgrade -y
			echo ""
			echo $AMARELO"Sistema atualizado."$FIMCOR
			sleep 1
		else
			echo ""
			echo $AMARELO"O sistema não será atualizado."$FIMCOR
			sleep 1
		fi
		echo ""$AMARELO
		read -p "Aperte [ENTER] para voltar ao Menu Principal" enter
	elif [ "$op" -eq "5" ]
	then
		logo
		echo $AMARELO"IP Scanner"
		echo ""
		echo "Digite um IP ou endereço válido (não coloque http://)"
		echo "Exemplos:"
		echo ""
		echo "74.125.131.94"
		echo "ou"
		echo "www.google.com.br"
		echo ""$FIMCOR
		read -p "[>]: " IP
		echo ""$AMARELO
		echo "Aguarde..."
		a=`curl -A "Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_3_3 like Mac OS X; en-us) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2 Mobile/8J2 Safari/6533.18.5" -s http://www.ip-adress.com/ip_tracer/$IP`
		echo $a >> arq.txt
		ar=`cat arq.txt`
		pais=`echo $ar | awk -F 'ip address flag' '{print $2}' | awk -F '>' '{print $2}' | awk -F '<' '{print $1}'`
		estado=`echo $ar | awk -F 'IP address state' '{print $2}' | awk -F '>' '{print $3}' | awk -F '<' '{print $1}' | awk -F ' ' '{$1="";print}'`
		cidade=`echo $ar | awk -F 'P address city' '{print $2}' | awk -F '>' '{print $3}' | awk -F '<' '{print $1}' | awk -F ' ' '{$1="";print}'`
		lati=`echo $ar | awk -F 'IP address latitude' '{print $2}' | awk -F '>' '{print $3}' | awk -F '<' '{print $1}' | awk -F ' ' '{$1="";print}'`
		longi=`echo $ar | awk -F 'IP address longitude' '{print $2}' | awk -F '>' '{print $3}' | awk -F '<' '{print $1}' | awk -F ' ' '{$1="";print}'`
		org=`echo $ar | awk -F 'Organization' '{print $2}' | awk -F '>' '{print $3}' | awk -F '<' '{print $1}' | awk -F ' ' '{$1="";print}'`
		isp=`echo $ar | awk -F 'ISP of this IP' '{print $2}' | awk -F '>' '{print $5}' | awk -F '<' '{print $1}' | awk -F ' ' '{$1="";print}'`
		logo
		echo $AMARELO"IP Scanner"
		echo ""
		echo "Informações Básicas"
		echo ""$CIANO
		echo "País:\t\t\t$pais"
		echo "Estado:\t\t\t$estado"
		echo "Cidade:\t\t\t$cidade"
		echo "Latitude:\t\t$lati"
		echo "Longitude:\t\t$longi"
		echo "ISP:\t\t\t$isp"
		echo "Organização:\t\t$org"
		rm arq.txt
		echo ""$AMARELO
		read -p "Aperte [ENTER] para continuar (whois)" enter

		logo
		echo $AMARELO"IP Scanner"$FIMCOR
		echo ""
		whois $IP
		echo ""$AMARELO
		read -p "Aperte [ENTER] para continuar (nmap)" enter
		
		logo
		echo $AMARELO"IP Scanner"
		echo ""
		echo "Executando Nmap. Aguarde..."
		echo ""$FIMCOR
		nmap -PN -O -T4 --script http-enum,http-headers,http-methods,http-php-version,http-sql-injection $IP
		
		echo ""$AMARELO
		read -p "Aperte [ENTER] para voltar ao Menu Principal" enter
	else
		echo $AMARELO"Saindo..."$FIMCOR
		exit
	fi
	echo ""
	echo $AMARELO"Voltando ao menu principal..."$FIMCOR
	sleep 1
	menu
}

subterfuge()
{
	wget http://subterfuge.googlecode.com/files/SubterfugePublicBeta5.0.tar.gz
	tar zxvf SubterfugePublicBeta5.0.tar.gz
	cd subterfuge
	python install.py
	cd ../
	rm -rf subterfuge/
	rm SubterfugePublicBeta5.0.tar.gz
}

ghost()
{
	wget http://ghost-phisher.googlecode.com/files/Ghost-Phisher_1.5_all.deb
	dpkg -i Ghost-Phisher_1.5_all.deb
	rm Ghost-Phisher_1.5_all.deb
	apt-get -f install
}

raidcall()
{
	wget http://update.raidcall.com/download/raidcall.exe?v=7.2.6
	mv raidcall.exe?v=7.2.6 raidcall.exe
	wine raidcall.exe
	rm raidcall.exe
}

distro='Kali'
if ! cat /etc/issue | grep -q "$distro"
then
	echo $AMARELO"Este script é recomendado apenas para o Kali Linux."
	echo "Saindo..."$FIMCOR
	exit
fi

if [ "$(id -u)" -eq "0" ]
then
	ping -q -c 1 -w 2 www.google.com > /dev/null
	if [ "$?" -eq "0" ]
	then
		echo $AMARELO"Conexão com a Internet - [OK]"
		sleep 1
		menu
	else
		clear
		logo
		echo $AMARELO"Conexão com a Internet - [Falhou]"
		echo "Verifique sua conexão e tente novamente."$FIMCOR
		echo ""
		exit
	fi
else
	echo $AMARELO"Este script só pode ser executado pelo usuário ROOT."$FIMCOR
	exit
fi
