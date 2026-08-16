# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    packages.nix                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/02/09 22:01:56 by tomoron           #+#    #+#              #
#    Updated: 2026/08/16 16:23:52 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ inputs, pkgs, ...}:

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

    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
