# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    docker.nix                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/09/06 00:10:58 by tomoron           #+#    #+#              #
#    Updated: 2025/09/06 01:06:23 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ config, lib, ... }:

{
  options.mods.docker = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "enable docker";
    };
    boot = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "start docker with the system (if false, trigered by docker.socket)";
    };
  };

  config = lib.mkIf config.mods.docker.enable {
    virtualisation.docker = {
      enable = true;
      liveRestore = false;
      enableOnBoot = config.mods.docker.boot;
    };
  };
}
