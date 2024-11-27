{ config, lib, pkgs, username,homeDir, ... }:

{
  imports = [ ../modules/nitrogen.nix ];

  home.packages = with pkgs;[	
	neovim
	dmenu
	brightnessctl
  ];

  home.file = {
    ".config/sxhkd".source = dotfiles/config/sxhkd;
	".config/bspwm/host.sh".source = ./bspwm/host.sh;
  };
  programs.firefox.enable = false;
}
