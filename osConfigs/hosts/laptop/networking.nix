# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    networking.nix                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/10/27 21:08:46 by tomoron           #+#    #+#              #
#    Updated: 2026/10/28 13:30:02 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ pkgs,  ... }:
{
  environment.systemPackages = with pkgs; [
	  impala
  ];

  networking = {
    hostName = "patate-douce";

    dhcpcd.enable = false;

    networkmanager.wifi.backend = "iwd";
    networkmanager.enable = false;

    wireless.iwd.enable = true;
    wireless.allowAuxiliaryImperativeNetworks = true;

    firewall.enable = false;
    useNetworkd = true;
  };

  systemd.network.enable = true;
}
