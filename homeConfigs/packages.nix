# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    packages.nix                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/02/09 22:01:56 by tomoron           #+#    #+#              #
#    Updated: 2025/02/12 12:53:12 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ pkgs, ...}:

{
  home.packages = with pkgs;[
	ripgrep

	activate-linux
	unison
	discord	
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
  ];
}
