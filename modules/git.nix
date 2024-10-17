{ config, lib, pkgs, username,homeDir, ... }:

{
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
}
