# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    netxloud-cron-job.nix                              :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/10/27 20:25:01 by tomoron           #+#    #+#              #
#    Updated: 2026/10/27 20:25:29 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{pkgs, ... }:
{
  systemd.timers."nextcloud-cron-job" = {
    wantedBy = [ "timers.target" ];
      timerConfig = {
        OnBootSec = "5m";
        OnUnitActiveSec = "5m";
        Unit = "nextcloud-cron-job.service";
      };
  };
  
  systemd.services."nextcloud-cron-job" = {
    script = ''
	  ${pkgs.docker}/bin/docker exec -u www-data nextcloud php /var/www/html/cron.php
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };
  };
}
