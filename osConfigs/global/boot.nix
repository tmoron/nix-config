# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    boot.nix                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/09/05 23:37:58 by tomoron           #+#    #+#              #
#    Updated: 2026/04/25 21:44:28 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{lib, pkgs, ... } :

{
  boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;

  boot.loader = {
    systemd-boot.enable = true;
    systemd-boot.memtest86.enable = true;
    efi.canTouchEfiVariables = true;
    timeout = 1;
  };

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
	  themePackages = with pkgs; [ #(adi1090x-plymouth-themes.override { 
#		  selected_themes = [ "black_hud" "circle_hud" "square_hud" "spinner_alt" ];
#	    })
#	    catppuccin-plymouth
		nixos-bgrt-plymouth
	  ];
  };

  services.journald.extraConfig = ''
    SystemMaxUse=100M
    SystemMaxFileSize=50M
  '';
}
