# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    game.nix                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/09/05 23:47:09 by tomoron           #+#    #+#              #
#    Updated: 2025/10/27 00:50:29 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{config, lib, ... }:

{
  options.mods.gayming.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "enable steam and other";
  };

  config = lib.mkIf config.mods.gayming.enable {
    programs.steam.enable = true; 
    programs.steam.protontricks.enable = true;
    programs.gamescope.enable = true;
  };
}
