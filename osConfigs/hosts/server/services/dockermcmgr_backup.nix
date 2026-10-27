# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    dockermcmgr_backup.nix                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/10/27 22:15:46 by tomoron           #+#    #+#              #
#    Updated: 2026/10/27 22:15:46 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ lib, pkgs, ... }:
{
  systemd.timers."dockermcmgr_backup_sync" = {
    wantedBy = [ "timers.target" ];
      timerConfig = {
        OnBootSec = "1h";
        OnUnitActiveSec = "1h";
        Unit = "dockermcmgr_backup_sync.service";
      };
  };
  
  systemd.services."dockermcmgr_backup_sync" = {
    script = ''
      ${lib.getExe pkgs.rsync} -rt --inplace /home/tom/mc_servers /raid/crit/backups/mc_servers_sync
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "tom";
    };
  };
}
