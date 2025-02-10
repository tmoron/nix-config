{ lib, config, ... }:

{
  config = lib.mkIf config.mods.hyprland.enable {
    services.hypridle = {
      enable = true;
        settings = {
          general.lock_cmd = "hyprlock";	
          general.before_sleep_cmd = "loginctl lock-session";
          listener  = [
          {
            timeout = 150;
            on-timeout = "brightnessctl -s set 0";
            on-resume = "brightnessctl -r";
          }
          {
            timeout = 150;
            on-timeout = "loginctl lock-session";
          }
          {
            timeout = 600;
            on-timeout = "systemctl suspend";
          }
        ];
      };
    };
  };
}
