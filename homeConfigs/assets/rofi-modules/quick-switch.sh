#!/usr/bin/env bash
echo "params : $@" 1>&2
echo -e "\0prompt\x1f>"
echo -e "\0use-hot-keys\x1ftrue"

if [[ -z $@ ]]; then
	echo d
	echo f
	if [[ -v ENABLE_HA ]];then echo h; fi
	exit
fi

first_letter=${1:0:1}
case "$first_letter" in 
	"d")
		echo -e "\0switch-mode\x1fdrun"
		;;
	"f")
		echo -e "\0switch-mode\x1ffirefox"
		;;
	"h")
		if [[ -z ENABLE_HA ]]; then
			echo "homeassistant is disabled"
			exit 1
		fi
		echo -e "\0switch-mode\x1fhomeassistant"
		;;
	*)
		echo "unknown command"
		;;
esac
