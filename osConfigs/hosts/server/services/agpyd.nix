# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    agpyd.nix                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/10/27 23:33:54 by tomoron           #+#    #+#              #
#    Updated: 2026/10/28 17:51:34 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ pkgs, ... }:
{
  systemd.timers."agpyd-weekly-explo" = {
    wantedBy = [ "timers.target" ];
      timerConfig = {
        OnCalendar="Mon 4:00:00"; #run every monday at 4 am
        Unit = "agpyd-weekly-explo";
      };
  };
  
  systemd.services."agpyd-weekly-explo" = {
    path = with pkgs; [
      bash
      eyed3
      jq
      coreutils
      util-linux
      curl
      which
      yt-dlp
    ];

    script = ''
      cd /raid/jellyfin/media/musics/explo/agpyd
      bash ./download_playlist.sh weekly-explo
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "tom";
    };
  };
}
