{ ... }:

{
  programs.waybar.enable = true;
  programs.waybar.settings.mainBar = {
    layer  = "top";
    position ="top";
    height = 24;
    margin-left = 5;
    margin-right = 5;
    modules-left = ["hyprland/workspaces" "custom/music"];
    modules-center = ["hyprland/window"];
    modules-right = [
	  "disk"
	  "pulseaudio"
	  "cpu" 
	  "temperature"
	  "memory"
	  "battery"

	  "network"
	  "custom/separator"
	  "clock"
	];

	"hyprland/window" = {
		max-length = 50;	
	};

	"custom/separator" = {
	  format = "|";
	};

  };
}
