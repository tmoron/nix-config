# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    touchpad.nix                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/09/06 00:39:41 by tomoron           #+#    #+#              #
#    Updated: 2025/09/06 01:02:41 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ config, lib, ... }:

{
  options.mods.touchpad = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "enable touchpad support";
    };
  };
  
  config = lib.mkIf config.mods.touchpad.enable {
    services.libinput.enable = true;
    services.libinput.touchpad.clickMethod = "clickfinger";
    services.libinput.touchpad.tapping = false;
  };
}
