#!/bin/bash
if [ $EUID != 0 ]; then
	sudo -s "$0" "$@"
	exit $?
fi

USER_HOME=$(getent passwd $SUDO_USER | cut -d: -f6)

#colors
RED="0;31"
GREEN="0;32"
BLUE="0;34"
YELLOW="1;33"

#messages
ESCAPE="\033["
MESSAGE="${ESCAPE}${BLUE}m"
WARNING="${ESCAPE}${YELLOW}m"
ERROR="${ESCAPE}${RED}m"
SUCCESS="${ESCAPE}${GREEN}m"
NC="${ESCAPE}0m"

while true; do
	read -p "do you want to install component and scene? (y/n): " ins
	case $ins in
		[yY]* ) 
			printf "${MESSAGE}Changing executable permissions for component.sh...${NC}"
			chmod +x component.sh
			echo -e "${SUCCESS}DONE"
			printf "${MESSAGE}Changing executable permissions for scene.sh...${NC}"
			chmod +x scene.sh
			echo -e "${SUCCESS}DONE"
			printf "${MESSAGE}Copying component.sh to /usr/local/bin/component...${NC}"
			cp component.sh /usr/local/bin/component
			echo -e "${SUCCESS}DONE"
			printf "${MESSAGE}Copying scene.sh to /usr/local/bin/scene...${NC}"
			cp scene.sh /usr/local/bin/scene
			echo -e "${SUCCESS}DONE"
			printf "${MESSAGE}Creating .ymir in ~/ ...${NC}"
			mkdir $USER_HOME/.ymir
			echo -e "${SUCCESS}DONE"
			printf "${MESSAGE}Copying files/ to .ymir/files ...${NC}"
			cp -r files/ $USER_HOME/.ymir/files
			echo -e "${SUCCESS}DONE"
			break
			;;
		[nN]* ) break;;
		* ) echo -e "${ERROR}Please answer [y|Y] or [n|N]";;
	esac
done
echo -e "${SUCCESS}Installation completed"
