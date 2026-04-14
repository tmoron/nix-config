# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    other.nix                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/02/09 01:43:46 by tomoron           #+#    #+#              #
#    Updated: 2026/04/03 22:08:01 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ lib, ... }:

{ 
  networking.hostName = lib.mkDefault "unnamed-nixos";
  networking.networkmanager.enable = lib.mkDefault true;

  programs.fuse.enable = true;

  time.timeZone = "Europe/Paris";

  services.xserver.enable = lib.mkDefault true;
  services.xserver.displayManager.startx.enable = true;

  programs.hyprland.enable = lib.mkDefault true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  hardware.logitech.wireless.enable = true;
  hardware.logitech.wireless.enableGraphical = true;

  services.fstrim.enable = true; # trims all the ssds on the machine every week
}
