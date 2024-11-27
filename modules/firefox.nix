{ config, lib, pkgs, inputs, username, homeDir, ... }:

{
  programs.firefox = {
    enable = lib.mkDefault true;
    profiles.default = {
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; 
	  [vimium ublock-origin];
	};
  };
}
