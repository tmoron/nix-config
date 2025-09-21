# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    home.nix                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/17 18:15:38 by tomoron           #+#    #+#              #
#    Updated: 2025/09/19 19:23:28 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{lib, pkgs, config, username ? "tom" ,homeDir ? "/home/tom", isOs ? false, ... }:

{
  imports = lib.concatLists [
    [ ./packages.nix ]
    (lib.fileset.toList ./modules)
  ];

  home.username = lib.mkIf (!isOs) "${username}";
  home.homeDirectory = lib.mkIf (!isOs) "${homeDir}";

  home.stateVersion = "24.05";

  sops.defaultSopsFile = ../secrets/secrets.yaml;
  sops.age.keyFile = "${homeDir}/.config/sops/age/keys.txt";
  sops.secrets."nextcloud_fuse/password" = {};

  programs.rclone.enable = true;
  programs.rclone.remotes.nextcloud = {
    config = {
	  type = "webdav";
	  url = "https://nc.tmoron.fr/remote.php/dav/files/tom";
	  vendor = "nextcloud";
	  user = "tom";
    };
	secrets.pass = config.sops.secrets."nextcloud_fuse/password".path;
	mounts = {
	  "/" = {
	    enable = true;
		mountPoint = "${homeDir}/nextcloud";
		options.vfs-cache-mode = "writes";
	  };
	};
  };

#  programs.ghostty.enable = true;
#  programs.ghostty.settings = {
#    theme = "catppuccin-mocha";
#	font-size = 9;
#  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  gtk = {
    enable = true;
    theme = { package = pkgs.flat-remix-gtk; name = "Flat-Remix-GTK-Grey-Darkest"; };
#    iconTheme = { package = pkgs.adwaita-icon-theme; name = "Adwaita"; };
    font = { name = "Sans"; size = 11; };
  };

  home.shellAliases = {
    ls= "ls --color=auto";
    grep = "grep --color=auto";
    vim = "nvim";
    vi = "nvim";
    hl = "Hyprland";
    clr = "clear";
#    tagueule = "asusctl profile -P Quiet";
#    parle = "asusctl profile -P performance";
	noidle = "systemctl --user stop hypridle";
  };
  
  programs.bash = {
	enable = true;
    historyControl = ["ignoreboth"];
	historyIgnore = [ "ls" "cd" "exit" ];
	shellOptions = [ "cdspell" "autocd"];
  };

  home.sessionPath = [ "~/.local/bin" ];

  
  programs.rofi = {
    enable = true;
	theme = "rounded-nord-dark";
  };


  home.file = { #should be able to make most of these in nix configs 
    ".config/wallpaper.png".source = lib.mkDefault utils/wallpaper_test.png;
    ".config/pc.jpg".source = lib.mkDefault utils/pc.jpg;
  	#".config/rofi/config.rasi".text = "@theme \"rounded-nord-dark.rasi\"";

	".local/share/rofi/themes".source = "${builtins.fetchGit {
		url = "https://github.com/newmanls/rofi-themes-collection";
		rev = "c8239a45edced3502894e1716a8b661fdea8f1c9";
		ref = "master";
    }}/themes";

  };
  services.dunst.enable = true;

  programs.home-manager.enable = true;

  qt.style.name = "kvantum";
  catppuccin.kvantum.apply = true;
  catppuccin.rofi.enable = false;

  catppuccin = {
  	enable = true;
	flavor = "mocha";

	dunst.enable = true;
	dunst.flavor="frappe";
  };
}
