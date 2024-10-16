{ config, lib, pkgs, username,homeDir, ... }:

{
  home.packages = with pkgs;[	
	neovim
	dmenu
  ];

  home.file = {
    ".config/sxhkd".source = dotfiles/config/sxhkd;
    ".config/nitrogen".source = dotfiles/config/nitrogen;
    ".config/bspwm/bspwmrc".source = dotfiles/config/bspwm/bspwmrc;
  };
}
