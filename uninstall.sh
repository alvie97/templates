
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
	read -p "do you want to uninstall component and scene? (y/n): " uns
	case $uns in
		[yY]* ) 
			printf "${MESSAGE}Deleting component.sh from /usr/local/bin...${NC}"
			rm /usr/local/bin/component
			echo -e "${SUCCESS}DONE"
			printf "${MESSAGE}Deleting scene.sh from /usr/local/bin...${NC}"
			rm /usr/local/bin/scene
			echo -e "${SUCCESS}DONE"
			printf "${MESSAGE}Deleting directory .ymir...${NC}"
			rm -r $USER_HOME/.ymir
			echo -e "${SUCCESS}DONE"
			break
			;;
		[nN]* ) break;;
		* ) echo -e "${ERROR}Please answer [y|Y] or [n|N]";;
	esac
done
echo -e "${SUCCESS}Uninstallation completed"
