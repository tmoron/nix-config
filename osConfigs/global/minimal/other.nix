# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    other.nix                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/06/14 18:02:15 by tomoron           #+#    #+#              #
#    Updated: 2026/06/15 02:06:17 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ lib, ... }:
{
  networking.hostName = lib.mkDefault "unnamed-nixos";
  networking.networkmanager.enable = lib.mkDefault true;

  time.timeZone = "Europe/Paris";

  services.fstrim.enable = true; # trims all the ssds on the machine every week
  catppuccin.enable = lib.mkDefault false;
  catppuccin.autoEnable = false;
} 
