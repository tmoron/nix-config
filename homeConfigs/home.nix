# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    home.nix                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/17 18:15:38 by tomoron           #+#    #+#              #
#    Updated: 2025/02/14 16:44:45 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{lib, pkgs, username,homeDir, ... }:

{
  imports = lib.concatLists [
    [ ./packages.nix ]
    (lib.fileset.toList ./modules)
  ];
  
  home.username = "${username}";
  home.homeDirectory = "${homeDir}";

  home.stateVersion = "24.05";

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  gtk = {
    enable = true;
    theme = { package = pkgs.flat-remix-gtk; name = "Flat-Remix-GTK-Grey-Darkest"; };
    iconTheme = { package = pkgs.adwaita-icon-theme; name = "Adwaita"; };
    font = { name = "Sans"; size = 11; };
  };

  home.shellAliases = {
    ls= "ls --color=auto";
    grep = "grep --color=auto";
    vim = "nvim";
    vi = "nvim";
    hl = "Hyprland";
    clr = "clear";
    tagueule = "asusctl profile -P Quiet";
    parle = "asusctl profile -P performance";
  };
  
  programs.bash = {
	enable = true;
    historyControl = ["ignoreboth"];
	historyIgnore = [ "ls" "cd" "exit" ];
	shellOptions = [ "cdspell" "autocd"];
	bashrcExtra = ''
      cd() {
      	builtin cd "$@"
      	echo -n "$PWD" > ~/.last_directory
      }
      [ -z "\$${PS1:-}" ] && return
      
      if [ -f ~/.last_directory ];then
      	echo -n going to
      	cat ~/.last_directory
      	echo
      	builtin cd "$(cat ~/.last_directory)"
      fi
	'';
  };

  home.sessionPath = [ "~/.local/bin" ];

  home.file = { #should be able to make most of these in nix configs 
    ".config/wallpaper.png".source = lib.mkDefault utils/wallpaper.png;
    ".config/pc.jpg".source = lib.mkDefault utils/pc.jpg;

	".local/share/rofi/themes".source = "${builtins.fetchGit {
		url = "https://github.com/newmanls/rofi-themes-collection";
		rev = "c8239a45edced3502894e1716a8b661fdea8f1c9";
		ref = "master";
    }}/themes";

	".local/bin/desk_sync".source = dotfiles/local/bin/desk_sync;
  };
  programs.home-manager.enable = true;
}
