# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    home.nix                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/17 18:15:38 by tomoron           #+#    #+#              #
#    Updated: 2024/10/19 14:12:59 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ config, lib, pkgs, username,homeDir, ... }:

{
  imports = [
	modules/git.nix
	modules/picom.nix
	modules/alacritty.nix
	modules/vim.nix
  ];
  
  home.username = "${username}";
  home.homeDirectory = "${homeDir}";

  home.stateVersion = "24.05";

  home.packages = with pkgs;[
    polybarFull
    sxhkd
    nitrogen
    nerdfonts
    rofi
    firefox
	neovim
	activate-linux
	bspwm
	dunst
	numlockx
  ];
  
  home.file = {
    ".config/bspwm/bspwmrc".source = lib.mkDefault dotfiles/config/bspwm/bspwmrc;
    ".config/sxhkd".source = lib.mkDefault dotfiles/config/sxhkd;
    ".config/polybar".source = dotfiles/config/polybar;
    ".config/nitrogen/wallpaper.png".source = lib.mkDefault dotfiles/config/nitrogen/wallpaper.png;
    ".xinitrc".source = dotfiles/xinitrc;
    ".bashrc".source = dotfiles/bashrc;

	".local/share/rofi/themes".source = "${builtins.fetchGit {
		url = "https://github.com/newmanls/rofi-themes-collection";
		rev = "c8239a45edced3502894e1716a8b661fdea8f1c9";
		ref = "master";
    }}/themes";

	".local/bin/desk_sync".source = dotfiles/local/bin/desk_sync;
  };

  programs.home-manager.enable = true;
}
