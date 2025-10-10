{ config, lib, ... }:

{
  options.mods.git.enable = lib.mkOption {
	type = lib.types.bool;
	default = true;
	description = "git configuration";
  };

  config = lib.mkIf config.mods.git.enable {
    programs.git = {
      enable = true;
	  lfs.enable = true;
      userEmail = "tomoron@student.42angouleme.fr";
      userName = "tomoron";
      extraConfig = {
      	init.defaultBranch="master";
      	pull.rebase = true;
      	push.autoSetupRemote = true;
		rerere.enabled = true;
		help.autocorrect = 1;
		user.signingkey = "251B4BD73683A8DF13D760A868BFAFE31DF313AD";
		commit.gpgsign = true;
      };
      aliases = {
        fuck = "!f() { git reset --hard \"@{upstream}\" && git restore . && git clean -f .; };f";
        back = "reset HEAD~";
      };
    };
  };
}
