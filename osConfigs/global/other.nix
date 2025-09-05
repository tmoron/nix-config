# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    other.nix                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/02/09 01:43:46 by tomoron           #+#    #+#              #
#    Updated: 2025/09/06 00:51:46 by tomoron          ###   ########.fr        #
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
}
