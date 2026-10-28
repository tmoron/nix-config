# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    zfs_srv_backup.nix                                 :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/10/27 20:50:45 by tomoron           #+#    #+#              #
#    Updated: 2026/10/28 12:27:15 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ pkgs, ... }:
{
  mods.zfs.enable = true;
  boot.zfs.forceImportRoot = false;
  boot.zfs.extraPools = [ "stor" ];

  environment.systemPackages = with pkgs; [
    lzop
    mbuffer
  ];

  users.users.sync = {
    isNormalUser = true;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIkVmIAJZewJVC6i1f39P7D36OPsdKqMNejALhBo92Td backup@server"
  	  "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIPy6ObpsitxHkRZzGbYdBpsBbR1YygtZOeClN2C/thu4AAAABHNzaDo= ssh:"
    ];
  };
}
