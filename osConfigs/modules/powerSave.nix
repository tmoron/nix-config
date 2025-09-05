# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    powerSave.nix                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/09/06 00:45:04 by tomoron           #+#    #+#              #
#    Updated: 2025/09/06 01:02:29 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ config, lib, ... }:

{
  options.mods.powerSave = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "enable services and settings to save power";
    };
  };

  config = lib.mkIf config.mods.powerSave.enable {
    services.tlp.enable = true;
    powerManagement.enable = true;
    powerManagement.cpuFreqGovernor = "powersave";
    services.upower.enable = true;
    mods.nvidia.prime = true;
  };
}
