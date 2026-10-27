# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    dockermcmgr.nix                                    :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/10/27 20:27:33 by tomoron           #+#    #+#              #
#    Updated: 2026/10/27 20:28:14 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{inputs, pkgs, ... }:
{
  environment.systemPackages = [
    inputs.dockermcmgr.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  systemd.services.dockermcmgr-server = {
    enable = true;
	  wantedBy = ["multi-user.target"];
	  restartIfChanged = true;
	  serviceConfig = {
	    ExecStart = "${inputs.dockermcmgr.packages.${pkgs.stdenv.hostPlatform.system}.default}/bin/dmm serverMode";
	    User = "tom";
	    Group= "users";
	  };
  };
}
