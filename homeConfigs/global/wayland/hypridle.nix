{ ... }:

{
  home.shellAliases.noidle = "systemctl --user stop hypridle";
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
		{
          timeout = 1800;
          on-timeout = "systemctl suspend";
        }
      ];
	};
  };
}
