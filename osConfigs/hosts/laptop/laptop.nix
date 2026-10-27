# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    laptop.nix                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/09/06 00:56:57 by tomoron           #+#    #+#              #
#    Updated: 2026/10/27 22:12:16 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ lib, pkgs, ... }:

{
  boot.initrd.systemd.enable = true;
  boot.initrd.luks.devices.cryptroot = {
      device = "/dev/disk/by-uuid/a4593b01-069d-4a5d-a550-74a762b89b3f";
      allowDiscards = true;
  };

  boot.blacklistedKernelModules = [ "nvidia" "nvidia_drm" "nvidia_uvm" ]; #speeds up startup, loaded automatically when gpu is started


  mods.touchpad.enable = true;
  mods.powerSave = {
    enable = true;
    powahCommandAdditions = [
      "supergfxctl -m Hybrid"
      "if [ $# -gt 0 ] && [[ \"$1\" == \"moar\" ]] ; then asusctl profile set Performance; fi"
    ];
    tagueuleCommandAdditions = [
      "echo \"can't safely turn off the GPU\""
      "asusctl profile set Quiet"
    ];
	  cpuMaxFreq = 4465261;

  };

  programs.wireshark.enable = true;
  programs.wireshark.usbmon.enable = true;

  mods.yubikey.pam.enable = true;
  mods.docker.enable = true;

  mods.nvidia.enable = true;
  mods.nvidia.prime = true;

  services.usbmuxd.enable = true; #iphone usb service sometimes hangs when shutting down

  programs.corectrl.enable = true;
}
