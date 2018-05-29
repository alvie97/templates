#!/bin/bash

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

DIR=~/.ymir

add_style() {
	if [[ $1 =~ ^y|Y$ ]]; then
		sed -e "s/@style\[\(.*\)\]/\1/g" -e "s/@\[ext\]/$4/g" $2 > $3
	else
		sed -e "s/@style\[.*\]//g" $2 > $3
	fi
}

render_template() {
	sed -i.bak -e "s/@\[name\]/$1/g" -e "s/@\[name\!\]/${1^}/g" $1.js
}

read -p "Enter component name: " name
echo -e "${MESSAGE}creating $name.js${NC}"
touch $name.js

while true; do
	read -p "Create style file? (y/n): " style
	case $style in
		[Yy] ) 
			read -p "Enter file extension: " ext
			touch $name.$ext
			break
			;;
		[Nn] ) break;;
		* ) echo -e "${ERROR}Please answer [y|Y] or [n|N]${NC}"
	esac
done

while true; do
	read -p "connect to store? (y/n): " store_connect
	case $store_connect in
		[Yy] ) 
			printf "${MESSAGE}Connecting to store...${NC}"
			add_style $style $DIR/files/store_connect.js $name.js $ext
			render_template $name
			echo -e "${SUCCESS}DONE${NC}"
			break
			;;
		[Nn] )
			out=0
			while true; do
				read -p "make it a class? (y/n): " class_component 
				case $class_component in
					[Yy] ) 
						printf "${MESSAGE}Creating class..."
						add_style $style $DIR/files/class_component.js $name.js $ext
						render_template $name
						echo -e "${SUCCESS}DONE${NC}"
						out=1
						break
						;;
					[Nn] ) 
						printf "${MESSAGE}Creating function..."
						add_style $style $DIR/files/function_component.js $name.js $ext
						render_template $name
						echo -e "${SUCCESS}DONE${NC}"
						out=1
						break
						;;
					* ) echo -e "${ERROR}Please answer [y|Y] or [n|N]${NC}"
				esac
			done
			[ $out ] && break
			;;
		* ) echo -e "${ERROR}Please answer [y|Y] or [n|N]${NC}";;
	esac
done

echo -e "${SUCCESS}Component $name created${NC}"
