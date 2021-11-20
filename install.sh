#!/bin/bash
#This script create for auto setup sublime text 3 in 32bit Debian system
# Author - Rajeev kumar


banner() {

  clear
  printf " \e[0m\e[1;33m
            ___.   .__  .__                
  ________ _\_ |__ |  | |__| _____   ____  
 /  ___/  |  \ __ \|  | |  |/     \_/ __ \ 
 \___ \|  |  / \_\ \  |_|  |  Y Y  \  ___/ 
/____  >____/|___  /____/__|__|_|  /\___  >
     \/          \/ \e[1;92mText3 | 32bit\e[0m\e[0m\e[1;33m\/     \/ \e[0m

\e[1;37m"
}

banner
ARCHITECTURE=$(uname -m)
PDIR="sublime_text_3_build_3211_x32.tar.bz2"

if [ $ARCHITECTURE = "x86_64" ]; then if [! dpkg -s wget >/dev/null 2>&1]; then
         sudo apt-get update -y && sudo apt-get install wget -y
      else  
         printf "Geting packeg sublimetext3 from https://www.sublimetext.com/3"; sleep 4s
         wget https://download.sublimetext.com/${PDIR}; sleep 2s
      fi  
    		 
fi

if [ -e ${PDIR} ]; then 
	MDIR=`tar -vxjf ${PDIR}` && sudo mv $(echo ${MDIR} | cut -f1 -d" ") /opt/sublime_text
	sudo rm -rf ${PDIR}	
fi

if cp /opt/sublime_text/sublime_text.desktop /usr/share/applications/; then 
     printf "\e[1;34mCongratulations Your sublime Text editor successfully install to\e[1;37m /opt/sublime_text\n"
     printf "\e[1;33mDesktop application shortcut successfully created to \e[1;37m/usr/share/applications/\ns"
fi   



