# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    boot.nix                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/09/05 23:37:58 by tomoron           #+#    #+#              #
#    Updated: 2026/06/14 17:50:09 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{pkgs, ... } :

{
  boot.consoleLogLevel = 3;
  boot.initrd.verbose = false;
  boot.kernelParams = [
    "quiet"
    "udev.log_level=3"
    "systemd.show_status=auto"
  ];

  catppuccin.plymouth.enable = false;

  boot.plymouth = {
	  enable = true;
	  theme = "nixos-bgrt";
	  themePackages = with pkgs; [ nixos-bgrt-plymouth ];
  };
}
