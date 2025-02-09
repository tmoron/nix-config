{ config, lib, pkgs, ... }:

{
	imports = [
	  ../modules/game.nix
	  ../modules/nitrogen.nix
	  ../../modules/hyprland.nix
	  ./hyprland.nix
	  ./waybar.nix
	];

#    programs.alacritty.settings.font.size = 8;
	home.packages = with pkgs; [
		stremio
	];

	home.file = {
      ".config/bspwm/host.sh".source = ./bspwm/host.sh;
	  ".config/bspwm/screenLayoutSingle.sh".source = ./bspwm/screenLayoutSingle.sh;
	  ".config/bspwm/screenLayoutDocked.sh".source = ./bspwm/screenLayoutDocked.sh;
	  ".config/bspwm/screenLayoutHDMI.sh".source = ./bspwm/screenLayoutHDMI.sh;
	};
}
