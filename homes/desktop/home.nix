{ config, lib, pkgs, ... }:

{
  imports = [ 
    ../modules/nitrogen.nix
	./hyprland.nix
  ];
  home.file = {
    ".config/bspwm/screenlayout.sh".source = ./bspwm/screenlayout.sh;
    ".config/bspwm/host.sh".source = ./bspwm/host.sh;
  };
}
