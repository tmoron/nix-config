# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    home.nix                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/17 18:15:38 by tomoron           #+#    #+#              #
#    Updated: 2024/10/17 18:15:39 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ config, lib, pkgs, username,homeDir, ... }:

{
  home.username = "${username}";
  home.homeDirectory = "${homeDir}";

  home.stateVersion = "24.05";

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs;[
    polybarFull
    sxhkd
    alacritty
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
    # ".screenrc".source = dotfiles/screenrc;
    ".config/bspwm/bspwmrc".source = lib.mkDefault dotfiles/config/bspwm/bspwmrc;
    ".config/sxhkd".source = lib.mkDefault dotfiles/config/sxhkd;
    ".config/polybar".source = dotfiles/config/polybar;
    ".config/nitrogen".source = lib.mkDefault dotfiles/config/nitrogen;
    ".config/alacritty".source = lib.mkDefault dotfiles/config/alacritty;
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


    # ".gradle/gradle.properties".text = ''
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };
  
  programs.git = {
    enable = true;
    userEmail = "tomoron@student.42angouleme.fr";
    userName = "tomoron";
	extraConfig.init.defaultBranch="master";
    aliases = {
	  fuck = "!f() { git reset --hard \"@{upstream}\" && git restore . && git clean -f .; };f";
	  back = "reset HEAD~";
    };
  };

  services.picom = {
    enable = true;
	package = pkgs.picom-pijulius;
    backend = lib.mkDefault "glx";
    vSync = true;
    settings = {
      blur = {
        method = lib.mkDefault "gaussian";
		size = lib.mkDefault 20;
		deviation = lib.mkDefault 5.0;
      };
	  corner-radius=20;
      rounded-corners-exclude = [
        "window_type = 'dock'"
	"class_g = 'Dunst'"
      ];
      blur-background-exclude = [
        "class_g = 'activate-linux'"
      ];
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
