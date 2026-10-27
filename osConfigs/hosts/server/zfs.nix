# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    zfs.nix                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/10/27 20:15:30 by tomoron           #+#    #+#              #
#    Updated: 2026/10/27 20:26:50 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ config, ... }:
{
  sops.secrets."zfs/p_user" = {};
  sops.secrets."zfs/p_token" = {};

  mods.zfs.enable = true;
  boot.zfs.forceImportRoot = false;
  boot.zfs.extraPools = [ "raid_vol" ];

  services.zfs = {
	  autoScrub.enable = true;
	  zed.settings = {
		ZED_NOTIFY_VERBOSE=1;
		ZED_PUSHOVER_TOKEN="$(cat ${config.sops.secrets."zfs/p_token".path})";
		ZED_PUSHOVER_USER="$(cat ${config.sops.secrets."zfs/p_user".path})";
	  };
  };
}
