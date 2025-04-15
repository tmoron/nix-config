{ config, lib, pkgs, ... }:

{
  options.mods.discord.enable = lib.mkOption {
    type = lib.types.bool;
	default = true;
	description = "install discord";
  };

  config = lib.mkIf config.mods.discord.enable { 
    home.packages = with pkgs;[
		discord 
	];
  };
}
