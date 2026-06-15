# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    boot.nix                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/06/14 17:49:47 by tomoron           #+#    #+#              #
#    Updated: 2026/06/14 17:50:06 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ lib, pkgs, ... }:

{
  boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;

  boot.loader = {
    systemd-boot.enable = true;
    systemd-boot.memtest86.enable = true;
    efi.canTouchEfiVariables = true;
    timeout = 1;
  };

  boot.tmp.cleanOnBoot = true;

  services.journald.extraConfig = ''
    SystemMaxUse=100M
    SystemMaxFileSize=50M
  '';
}
