# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    backup.nix                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/10/27 20:19:31 by tomoron           #+#    #+#              #
#    Updated: 2026/10/28 17:50:32 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ lib, ... }:

{
  services.syncoid.enable = true;
  services.syncoid.user = "backup";
  services.syncoid.group = "users";

  services.syncoid.service.serviceConfig = {
	BindReadOnlyPaths = [ "/home/backup/.ssh" ];
    ProtectHome = lib.mkForce false;
  };

  services.syncoid.sshKey = "/home/backup/.ssh/id_ed25519";
  services.syncoid.commands."raid_vol-critical" = {
    extraArgs = [ "--delete-target-snapshots" ];
    source = "raid_vol/crit";
	  target = "sync@192.168.1.41:stor/crit";
  };

  users.users.backup.isNormalUser = true;

  services.sanoid.enable = true;
  services.sanoid.datasets."raid_vol" = {
	  daily = 31;
	  hourly = 24;
	  monthly = 12;
	  autosnap = true;
	  autoprune = true;
  };
  services.sanoid.datasets."raid_vol/crit" = {
	  daily = 31;
	  hourly = 24;
	  monthly = 12;
	  autosnap = true;
	  autoprune = true;
  };
}
