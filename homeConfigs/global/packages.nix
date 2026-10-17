# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    packages.nix                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/02/09 22:01:56 by tomoron           #+#    #+#              #
#    Updated: 2026/10/17 21:28:13 by tomoron          ###   ########.fr        #
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

#    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default #broken
  	localsend
  ];
}
