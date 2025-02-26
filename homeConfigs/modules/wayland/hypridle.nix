{ lib, config, ... }:

{
  options.mods.hyprland.autoSuspend = lib.mkOption {
    type = lib.types.bool;
	default = true;
	description = "enable hypridle suspend after 10min";
  };
  
  config = lib.mkIf config.mods.hyprland.enable {
    services.hypridle = {
      enable = true;
        settings = {
          general.lock_cmd = "hyprlock";	
          general.before_sleep_cmd = "loginctl lock-session";
          listener  = [
          {
            timeout = 300;
            on-timeout = "brightnessctl -s set 0";
            on-resume = "brightnessctl -r";
          }
          {
            timeout = 300;
            on-timeout = "loginctl lock-session";
          }
        ] ++ lib.lists.optional config.mods.hyprland.autoSuspend {
            timeout = 600;
            on-timeout = "systemctl suspend";
          };
      };
    };
  };
}
