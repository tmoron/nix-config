#!/usr/bin/env bash
echo "params : $@" 1>&2
echo -e "\0prompt\x1f>"
echo -e "\0use-hot-keys\x1ftrue"

if [[ -z $@ ]]; then
	echo "
		d
		f
		h
	" | tail -n +2 | head -n -1 | sed "s/^[[:space:]]*//"
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
		echo -e "\0switch-mode\x1fhomeassistant"
		;;
	*)
		echo "unknown command"
		;;
esac
