# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    desktop.nix                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/09/06 00:57:04 by tomoron           #+#    #+#              #
#    Updated: 2026/10/27 21:07:58 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


{ ... }:

{
  boot.kernelParams = [ "nvidia-drm-modset=1" ];
  boot.kernelModules = [ "kvm-intel" "nvidia" ];
  hardware.cpu.intel.updateMicrocode = true;

  mods.yubikey.pam.enable = true;
  mods.nvidia.enable = true;

  networking.hostName = "nixos-fixe";
  networking.hostId = "98e475dd";
  networking.firewall.enable = false;

  services.openssh.enable = true;

  services.usbmuxd.enable = true; #iphone usb service, hangs sometimes when shutting down

  programs.wireshark.enable = true;
  programs.wireshark.usbmon.enable = true;

  mods.docker = {
    enable = true;
    boot = false;
  };
  mods.virtualHost.enable = true;
}
