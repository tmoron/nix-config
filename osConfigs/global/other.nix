# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    other.nix                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/02/09 01:43:46 by tomoron           #+#    #+#              #
#    Updated: 2026/09/13 13:03:00 by tomoron          ###   ########.fr        #
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
  programs.solaar.enable = true;

  programs.noisetorch.enable = true;
  programs.droidcam.enable = true;

  catppuccin.enable = true;
}
