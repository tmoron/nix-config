# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    powerSave.nix                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/09/06 00:45:04 by tomoron           #+#    #+#              #
#    Updated: 2025/09/17 18:47:27 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ config, lib, pkgs, ... }:

{
  options.mods.powerSave = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "enable services and settings to save power";
    };
    powahCommandAdditions = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [];
      description = "commands the `powah` script runs";
    };
    tagueuleCommandAdditions = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [];
      description = "commands the `tagueule` script runs";
    };
  };


  config = lib.mkIf config.mods.powerSave.enable {
    services.tlp = {
      enable = true;
      settings = {
        TLP_DEFAULT_MODE = "BAT";
        TLP_PERSISTENT_DEFAULT = 1;

		CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
    
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
    
        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 20;
      };
    };

	environment.systemPackages = [
	  (pkgs.writeShellApplication {
	    name = "powah";
	    runtimeInputs = with pkgs; [ tlp ];
	    text = ''
	    if [[ $EUID -ne 0 ]]; then
           echo "This script must be run as root" 
           exit 1
        fi
		tlp ac
        '' + lib.concatStringsSep "\n" config.mods.powerSave.powahCommandAdditions;
        })

	  (pkgs.writeShellApplication {
	    name = "tagueule";
	    runtimeInputs = with pkgs; [ tlp ];
	    text = ''
	    if [[ $EUID -ne 0 ]]; then
           echo "This script must be run as root" 
           exit 1
        fi
		tlp bat
        '' + lib.concatStringsSep "\n" config.mods.powerSave.tagueuleCommandAdditions;
        })
    ];

    powerManagement.enable = true;
    services.upower.enable = true;
    mods.nvidia.prime = true;
  };
}
