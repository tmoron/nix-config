{ config, lib, pkgs, ... }:

{
	imports = [ ../modules/game.nix ];
	home.file = {
    	".config/alacritty".source = dotfiles/config/alacritty;
	};
}
