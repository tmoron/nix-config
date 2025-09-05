# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    virtualHost.nix                                    :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/09/05 23:47:19 by tomoron           #+#    #+#              #
#    Updated: 2025/09/06 01:03:07 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ config, lib, pkgs, ... }:

{
  options.mods.virtualHost.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "enable virtual manager as host";
  };

  config = lib.mkIf config.mods.virtualHost.enable {
      programs.virt-manager.enable = true;
      virtualisation.libvirtd.enable = true;
      virtualisation.libvirtd.qemu.runAsRoot = true;
      virtualisation.libvirtd.qemu.vhostUserPackages = [ pkgs.virtiofsd ];
    virtualisation.spiceUSBRedirection.enable = true;

    environment.systemPackages = with pkgs; [ spice-gtk ];
  };
}
