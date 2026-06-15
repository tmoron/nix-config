# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    packages.nix                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/02/09 22:01:56 by tomoron           #+#    #+#              #
#    Updated: 2026/06/15 12:35:56 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ pkgs, ...}:

{
  home.packages = with pkgs;[
    pigz
    fastfetch 
    clang
    ninja
    gdb
    valgrind
    cmake
    stress

    activate-linux
    brightnessctl  
    playerctl
    vlc
    yubikey-manager
    bibata-cursors
    libcaca
    nasm
    nerd-fonts.iosevka
	compiledb
	yubikey-personalization
	libreoffice
	doxygen
	qimgv
	acpi

    discord 
    google-chrome
	localsend
  ];
}
