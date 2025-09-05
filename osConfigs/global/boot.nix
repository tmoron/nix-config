# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    boot.nix                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/09/05 23:37:58 by tomoron           #+#    #+#              #
#    Updated: 2025/09/06 00:56:38 by tomoron          ###   ########.fr        #
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

  services.journald.extraConfig = ''
    SystemMaxUse=100M
    SystemMaxFileSize=50M
  '';
}
