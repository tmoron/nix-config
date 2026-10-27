# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    cloudflared.nix                                    :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/10/27 20:17:15 by tomoron           #+#    #+#              #
#    Updated: 2026/10/27 20:17:44 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{pkgs, config, ... }:

{
  sops.secrets."cloudflared/token" = {};
  systemd.services.cloudflared = {
  	after = [
        "network.target"
        "network-online.target"
      ];
  	wants = [
        "network.target"
        "network-online.target"
      ];
  	wantedBy = [ "multi-user.target" ];
  	serviceConfig = {
  	  ExecStart = ''${pkgs.bash}/bin/bash -c '${pkgs.cloudflared}/bin/cloudflared tunnel --no-autoupdate run --token "$(cat ${config.sops.secrets."cloudflared/token".path})"' '';
  	  Restart = "on-failure";
  	};
  };
}
