{ ... }:
{
  programs.waybar.settings.mainBar = {
    battery = {
      bat = "BAT0";
  	  full-at = 79;
      states = {
        good = 20;
        critical = 15;
      };
      format-time = " {H}:{m}";
      format-discharging = "{icon} {capacity}%{time}";
  	  format-charging = " {capacity}%{time}";
  	  format-plugged = "";
      format-icons = [" " " " " " " " " "];
      interval = 10;
    };
  };
}
