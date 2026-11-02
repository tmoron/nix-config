# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    packages.nix                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/02/09 22:01:56 by tomoron           #+#    #+#              #
#    Updated: 2026/11/01 18:28:36 by tomoron          ###   ########.fr        #
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

    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  	localsend
  ];
}
