{ config, lib, pkgs, ... }:

{
  	home.packages = with pkgs;[ heroic ];
	services.picom.package = pkgs.picom-pijulius;
	home.file = {
    	".config/alacritty".source = dotfiles/config/alacritty;
	};
}
