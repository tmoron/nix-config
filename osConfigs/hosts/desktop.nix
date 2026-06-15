# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    desktop.nix                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/09/06 00:57:04 by tomoron           #+#    #+#              #
#    Updated: 2026/06/15 02:03:18 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


{ pkgs, ... }:

{
  boot.kernelParams = [ "nvidia-drm-modset=1" ];

  networking.hostName = "nixos-fixe";

  hardware.cpu.intel.updateMicrocode = true;

  mods.yubikey.pam.enable = true;
  mods.nvidia.enable = true;

  boot.kernelModules = [ "kvm-intel" "nvidia" ];

  services.openssh.enable = true;

  networking.hostId = "98e475dd";

  mods.zfs.enable = true;

  mods.docker = {
    enable = true;
    boot = false;
  };
}
