{ config, lib, pkgs, username,homeDir, ... }:

{
  programs.alacritty = {
    enable = true;
	settings = {
      window.opacity = 0.9;
	  env.XTERM = "xterm-256color";
	  font.size = lib.mkDefault 10;
	};
  };
}
