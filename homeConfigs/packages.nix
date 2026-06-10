# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    packages.nix                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/02/09 22:01:56 by tomoron           #+#    #+#              #
#    Updated: 2026/06/10 21:30:25 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ pkgs, inputs, ...}:

{
  home.packages = with pkgs;[
  	inputs.dockermcmgr.packages.${system}.default
    lrzip
    pigz
    htop
    gnumake
    git
    fastfetch 
    clang
    ninja
    gdb
    valgrind
    wget
    cmake
    man-pages
    stress
    ffmpeg-full
    ripgrep
    activate-linux
    unison
    brightnessctl  
    playerctl
    vlc
    nix-index
    yubikey-manager
    bibata-cursors
    libcaca
    nasm
    nerd-fonts.iosevka
	compiledb
	yubikey-personalization
	sops
	libreoffice
	doxygen
	qimgv
  ];
}
