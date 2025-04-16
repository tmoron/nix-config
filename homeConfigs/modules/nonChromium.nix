{ config, lib, pkgs, ... }:

{
  options.mods.nonChromium.enable = lib.mkOption {
    type = lib.types.bool;
	default = true;
	description = "all chromium/electron based application can't be built by act-runner, so they can't be in the iso";
  };

  config = lib.mkIf config.mods.nonChromium.enable { 
    home.packages = with pkgs;[
		discord 
		google-chrome
	];
  };
}
