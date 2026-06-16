{ lib, pkgs, ... }:
{
  programs.waybar.settings.mainBar = {
    pulseaudio = {
      format = "{icon}{volume}%";
      format-bluetooth = " {icon} {volume}%";
      format-muted = "";
      format-icons = {
        headphones = " ";
        handsfree = "󰋎 ";
        headset = "󰋎 ";
        phone = " ";
        portable = " ";
        car = " ";
        default = [" " " " "  "];
      };
      on-click = "${lib.getExe pkgs.pavucontrol}";
	  states = {
		low = 79;
		warning = 99;
		high = 100000;
	  };
    };
  };
}
