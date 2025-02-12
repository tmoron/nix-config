{ lib, pkgs, config , ... }:

{
  options.mods.x11.enable = lib.mkOption {
  	type = lib.types.bool;
  	default = false;
  	description = "configure x11";
  };

  config = lib.mkIf config.mods.x11.enable {
    home.file.".xinitrc".text = "exec bspwm";
    home.packages = with pkgs; [
      nitrogen
	  numlockx
    ];
  };
}
