{ pkgs, lib, config, ... }:

{
  config = lib.mkIf config.mods.hyprland.enable {
    home.packages = with pkgs; [
	  grim
	  slurp
	  wl-clipboard
	  swaybg
    ];
  };
}
