# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    home.nix                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/17 18:15:38 by tomoron           #+#    #+#              #
#    Updated: 2024/10/17 18:41:29 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ config, lib, pkgs, username,homeDir, ... }:

{
  imports = [
	modules/git.nix
	modules/picom.nix
	modules/alacritty.nix
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
  ];
  
  home.file = {
    ".config/bspwm/bspwmrc".source = lib.mkDefault dotfiles/config/bspwm/bspwmrc;
    ".config/sxhkd".source = lib.mkDefault dotfiles/config/sxhkd;
    ".config/polybar".source = dotfiles/config/polybar;
    ".config/nitrogen".source = lib.mkDefault dotfiles/config/nitrogen;
    ".config/nvim/init.vim".source = dotfiles/config/nvim/init.vim;
    ".config/nvim/plugin/stdheader.vim".source = dotfiles/config/nvim/plugin/stdheader.vim;
    ".local/share/nvim/site/autoload/plug.vim".source = dotfiles/local/share/nvim/site/autoload/plug.vim;
    ".xinitrc".source = dotfiles/xinitrc;
    ".vimrc".source = dotfiles/vimrc;
    ".bashrc".source = dotfiles/bashrc;

	".local/share/rofi/themes".source = "${builtins.fetchGit {
		url = "https://github.com/newmanls/rofi-themes-collection";
		rev = "c8239a45edced3502894e1716a8b661fdea8f1c9";
		ref = "master";
    }}/themes";
  };

  programs.home-manager.enable = true;
}
