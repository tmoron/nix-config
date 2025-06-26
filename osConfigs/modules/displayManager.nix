{config, lib, ... }:

{
  options.mods.displayManager.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "enable the display manager";
  };

  config = lib.mkIf config.mods.displayManager.enable {
  	services.displayManager.enable = true;
  	services.displayManager.ly.enable = true;
	services.displayManager.ly.settings = 
	{
	  sleep_cmd = "systemctl sleep";
	  asterisk = "A";
	  auth_fails= 3;
	};
  };
}

