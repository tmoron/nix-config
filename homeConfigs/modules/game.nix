{ config, lib, pkgs, ... }:

{
  options.mods.game.enable = lib.mkOption {
    type = lib.types.bool;
	default = true;
	description = "install packages for games (except steam , it's installed systemwide)";
  };

  config = lib.mkIf config.mods.game.enable { 
    home.packages = with pkgs;[
	  lutris
	  mangohud
	  moonlight-qt
	  prismlauncher

	  r2modman
	];
  };
}
