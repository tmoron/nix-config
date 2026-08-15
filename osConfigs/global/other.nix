# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    other.nix                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/02/09 01:43:46 by tomoron           #+#    #+#              #
#    Updated: 2026/08/12 19:26:37 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ lib, ... }:

{ 
  programs.fuse.enable = true;

  services.xserver.enable = lib.mkDefault true;
  services.xserver.displayManager.startx.enable = true;

  programs.hyprland.enable = lib.mkDefault true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  hardware.logitech.wireless.enable = true;
  hardware.logitech.wireless.enableGraphical = true;

  programs.noisetorch.enable = true;
  programs.droidcam.enable = true;

  catppuccin.enable = true;
  services.pcscd.enable = true;
}
