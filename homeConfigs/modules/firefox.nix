{ config, lib, inputs, ... }:

{
  options.mods.firefox.enable = lib.mkOption {
    type = lib.types.bool;
	default = true;
	description = "install and configure firefox";
  };

  config = lib.mkIf config.mods.firefox.enable {
  	catppuccin.firefox.enable = true;
    programs.firefox = {
      enable = lib.mkDefault true;
      profiles.default = {
        extensions.packages = with inputs.firefox-addons.packages."x86_64-linux"; 
	    [vimium ublock-origin];
		extensions.force = true;
	  };
    };
  };
}
