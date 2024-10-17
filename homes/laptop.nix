{ config, lib, pkgs, ... }:

{
	imports = [ modules/game.nix ];

    programs.alacritty.settings.font.size = 8;
}
