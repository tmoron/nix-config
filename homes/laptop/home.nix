{ config, lib, pkgs, ... }:

{
	imports = [
	  ../modules/game.nix
	  ./bspwm.nix
	];

    programs.alacritty.settings.font.size = 8;

	home.file = {
      ".config/bspwm/host.sh".source = ./bspwm/host.sh;
	  ".config/bspwm/screenlayout.sh".source = ./bspwm/host.sh;
	}
}
