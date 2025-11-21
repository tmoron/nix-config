# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    displayManager.nix                                 :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/09/05 23:47:16 by tomoron           #+#    #+#              #
#    Updated: 2025/11/17 14:32:13 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{config, lib, ... }:

{
  options.mods.displayManager.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "enable the ly display manager";
  };

  config = lib.mkIf config.mods.displayManager.enable {
      services.displayManager.enable = true;
      services.displayManager.ly.enable = true;
    services.displayManager.ly.settings = 
    {
      animation = "gameoflife";
      min_refresh_delta = 50;
      bigclock = "en";
      sleep_cmd = "systemctl sleep";
      asterisk = "A";
      auth_fails= 3;
    };
  };
}

