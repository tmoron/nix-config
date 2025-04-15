# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    packages.nix                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/02/09 22:01:56 by tomoron           #+#    #+#              #
#    Updated: 2025/04/15 15:34:14 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ pkgs, ...}:

{
  home.packages = with pkgs;[
	ripgrep

	activate-linux
	unison
	google-chrome
	brightnessctl	
	playerctl
	python3
	vlc
    nerd-fonts.iosevka

	nix-index
	yubikey-manager
	yubico-pam
	dunst
	bibata-cursors
	libcaca
	nasm
  ];
}
