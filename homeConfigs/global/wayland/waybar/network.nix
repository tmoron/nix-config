{ ... }:
{
  programs.waybar.settings.mainBar = {
    network = {
      format-wifi = "{icon} {essid}";
      format-ethernet = "󰈁 {ifname}";
      format-disconnected = "󰅛 ";
      format-icons = ["󰤟 " "󰤢 " "󰤥 " "󰤨 "];
	  max-length = 20;
    };
  };
}
