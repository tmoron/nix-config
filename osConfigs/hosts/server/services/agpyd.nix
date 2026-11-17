# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    agpyd.nix                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/10/27 23:33:54 by tomoron           #+#    #+#              #
#    Updated: 2026/11/11 17:27:43 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ lib, pkgs, ... }:
{
  systemd.timers."agpyd-weekly-explo" = {
    wantedBy = [ "timers.target" ];
      timerConfig = {
        OnCalendar="Mon 4:00:00"; #run every monday at 4 am
        Unit = "agpyd@weekly-explo.service";
      };
  };

  systemd.timers."agpyd-daily-jams" = {
    wantedBy = [ "timers.target" ];
      timerConfig = {
        OnCalendar="4:00:00"; #run every day at 4 am
        Unit = "agpyd@daily-jams.service";
      };
  };
  
  systemd.services."agpyd@" = {
    path = with pkgs; [
      bash
      eyed3
      jq
      gawk
      coreutils
      util-linux
      curl
      which
      yt-dlp
    ];

    serviceConfig = {
      Type = "oneshot";
      User = "tom";

      WorkingDirectory="/raid/jellyfin/media/musics/explo/agpyd";
      ExecStart="${lib.getExe pkgs.bash} ./download_playlist.sh %i";
    };
  };
}
