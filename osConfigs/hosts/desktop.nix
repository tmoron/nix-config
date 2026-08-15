# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    desktop.nix                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/09/06 00:57:04 by tomoron           #+#    #+#              #
#    Updated: 2026/08/16 00:22:21 by tomoron          ###   ########.fr        #
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
  boot.zfs.forceImportRoot = false;
  boot.zfs.extraPools = [ "stor" ];

  networking.firewall.enable = false;

  services.usbmuxd.enable = true; #iphone usb service sometimes hangs when shutting down

  programs.gnupg.agent.enable = true;
  programs.gnupg.agent.enableSSHSupport = true;


  mods.docker = {
    enable = true;
    boot = false;
  };

  users.users.sync = {
	isNormalUser = true;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIkVmIAJZewJVC6i1f39P7D36OPsdKqMNejALhBo92Td backup@server"
	  "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIPy6ObpsitxHkRZzGbYdBpsBbR1YygtZOeClN2C/thu4AAAABHNzaDo= ssh:"
    ];
  };
}
