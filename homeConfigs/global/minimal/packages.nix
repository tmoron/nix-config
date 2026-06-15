# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    packages.nix                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/02/09 22:01:56 by tomoron           #+#    #+#              #
#    Updated: 2026/06/14 19:11:25 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ pkgs, ...}:

{
  home.packages = with pkgs;[
    lrzip
    git
	lm_sensors
    wget
	curl
    man-pages
    ffmpeg-full
    nix-index
	sops
	screen
	btop
	htop
  ];
}
