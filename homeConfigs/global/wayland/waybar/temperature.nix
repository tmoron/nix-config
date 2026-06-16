{ lib, ... }:
{
  programs.waybar.settings.mainBar = {
    temperature = {
      thermal-zone = lib.mkDefault 0;
      critical-threshold = lib.mkDefault 85;
	  warning-threshold = lib.mkDefault 60;
      interval = 5;
	  format = "";
      format-warning ="{icon} {temperatureC}°C";
      format-critical ="{icon} {temperatureC}°C";
      format-icons = ["" "" "" "" ""];
    };
  };
}
