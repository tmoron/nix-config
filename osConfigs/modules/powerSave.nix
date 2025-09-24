# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    powerSave.nix                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/09/06 00:45:04 by tomoron           #+#    #+#              #
#    Updated: 2025/09/23 04:25:20 by tomoron          ###   ########.fr        #
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

    pStateCompatible = lib.mkOption {
	  type = lib.types.bool;
	  default = false;
	  description = "is the cpu p-state compatible. only most of intel cpu's";
	};

    cpuMaxFreq = lib.mkOption {
	  type = lib.types.ints.positive;
	  default = 5000000;
	  description = "the max frequency of the cpu (in KHz)";
	};

	governorPowers = {
      ac.min = lib.mkOption {
	    type = lib.types.ints.unsigned;
	    default = 30;
	    description = "min frequency on AC";
	  };
      ac.max = lib.mkOption {
	    type = lib.types.ints.unsigned;
	    default = 100;
	    description = "max frequency on AC";
	  };
      bat.min = lib.mkOption {
	    type = lib.types.ints.unsigned;
	    default = 0;
	    description = "min frequency on BAT";
	  };
      bat.max = lib.mkOption {
	    type = lib.types.ints.unsigned;
	    default = 40;
	    description = "max frequency on BAT";
	  };
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
      }
	  // lib.optionalAttrs (!config.mods.powerSave.pStateCompatible) (with config.mods.powerSave; {
        CPU_SCALING_MIN_FREQ_ON_AC  = (cpuMaxFreq * governorPowers.ac.min) / 100;
        CPU_SCALING_MAX_FREQ_ON_AC  = (cpuMaxFreq * governorPowers.ac.max) / 100;
        CPU_SCALING_MIN_FREQ_ON_BAT = (cpuMaxFreq * governorPowers.bat.min) / 100;
        CPU_SCALING_MAX_FREQ_ON_BAT = (cpuMaxFreq * governorPowers.bat.max) / 100;
      }) 
	  // lib.optionalAttrs config.mods.powerSave.pStateCompatible (with config.mods.powerSave.governorPowers; {
	    CPU_MIN_PERF_ON_AC = ac.min;
        CPU_MAX_PERF_ON_AC = ac.max;
        CPU_MIN_PERF_ON_BAT = bat.min;
        CPU_MAX_PERF_ON_BAT = bat.max;
	  });
    };

	environment.systemPackages = [
	  (pkgs.writeShellApplication {
	    name = "powah";
	    runtimeInputs = with pkgs; [ tlp ];
	    text = ''
	      if [[ $EUID -ne 0 ]]; then
            exec sudo bash "$0" "$@"
          fi
		  tlp ac
        '' + lib.concatStringsSep "\n" config.mods.powerSave.powahCommandAdditions;
        })

	  (pkgs.writeShellApplication {
	    name = "tagueule";
	    runtimeInputs = with pkgs; [ tlp ];
	    text = ''
	      if [[ $EUID -ne 0 ]]; then
            exec sudo bash "$0" "$@"
          fi
		  tlp bat
        '' + lib.concatStringsSep "\n" config.mods.powerSave.tagueuleCommandAdditions;
        })
    ];

    powerManagement.enable = true;
    mods.nvidia.prime = true;
  };
}
