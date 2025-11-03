# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    nvidia.nix                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/09/05 23:47:19 by tomoron           #+#    #+#              #
#    Updated: 2025/10/26 21:12:18 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


{ config, lib, ... }:

{
  options.mods.nvidia = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "enable nvidia drivers";
    };
    beta = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "use beta version of the drivers";
    };
    open = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "use open version of the drivers (on newer gpu)";
    };
    containerToolkit = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "enable the nvidia container toolkit (gpu in docker)";
    };
    prime = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "enable nvidia prime offload (saves battery)";
    };
  };
  
  config = lib.mkIf config.mods.nvidia.enable {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    hardware.nvidia = {
      package = lib.mkIf config.mods.nvidia.beta config.boot.kernelPackages.nvidiaPackages.beta;
      open = config.mods.nvidia.open;

      prime.offload = lib.mkIf config.mods.nvidia.prime {
        enable = true;
        enableOffloadCmd = true;
      };
    };

    hardware.nvidia-container-toolkit.enable = config.mods.nvidia.containerToolkit;

    services.xserver.videoDrivers = ["nvidia"];
  };

}
