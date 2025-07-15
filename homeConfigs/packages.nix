# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    packages.nix                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/02/09 22:01:56 by tomoron           #+#    #+#              #
#    Updated: 2025/07/15 16:10:34 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ pkgs, ...}:

{
  home.packages = with pkgs;[
    lrzip
    pigz
    htop
    gnumake
    git
    neofetch
    neovim
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
    python3
    vlc
    nix-index
    dunst
    yubikey-manager
    bibata-cursors
    libcaca
    nasm
  ];
}
