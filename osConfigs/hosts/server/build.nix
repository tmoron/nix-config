# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    build.nix                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/10/27 20:28:53 by tomoron           #+#    #+#              #
#    Updated: 2026/10/27 20:29:18 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ ... }:
{
  nix.settings.trusted-users = [ "root" "builder" "tom" ];

  boot.binfmt.emulatedSystems = [ "i686-linux" ];

  users.users.builder = {
	  isNormalUser = true;
	  openssh.authorizedKeys.keys = [
		"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICzRsLTBnow52e63Qp6JqUaLNOCpoIsPpJFOAhJOgF1M root@patate-douce"
		"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIl6m5mdyfixhVgcDIOHhRQRSyCH4//2XJ/MRmOLD8R4 root@nixos-fixe"
	  ];
      group = "builder";
  };
  users.groups.builder = {};

  mods.remote-build.enable = false;
}
