# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    desktop.nix                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/09/06 00:57:04 by tomoron           #+#    #+#              #
#    Updated: 2025/10/29 21:15:42 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


{ config, lib, inputs, pkgs, ... }:

{
  boot.kernelParams = [ "nvidia-drm-modset=1" ];
  environment.systemPackages = with pkgs; [
      lm_sensors # can be user (and global)
  ];

  networking.hostName = "nixos-fixe";

  hardware.cpu.intel.updateMicrocode = true;
  mods.yubikey.pam.enable = true;

  boot.kernelModules = [ "kvm-intel" "nvidia" ];
  mods.displayManager.enable = true;

  mods.nvidia.enable = true;
  mods.gayming.enable = true;

  programs.noisetorch.enable = true;

#  hardware.nvidia = {
#    open = true;
#
#    prime.nvidiaBusId = "PCI:1:0:0";
#    prime.intelBusId = "PCI:0:2:0";
#    prime.sync.enable = true;
#
#    modesetting.enable = true;
#  };

  services.openssh.enable = true;
}
