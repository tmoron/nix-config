{ lib, pkgs, config, ... }:

{
  programs.waybar.settings.mainBar.temperature.thermal-zone = 2;

  wayland.windowManager.hyprland.settings = {
    monitor = [
      { output = "DP-2"; mode = "1920x1080@60Hz"; position = "-1920x0"; scale="auto"; }
	    { output = "HDMI-A-3"; mode = "1920x1080@60Hz"; position = "0x0"; scale = "auto"; }
	    { output = "DP-3"; mode = "1920x1080@60.00Hz"; position = "1920x0"; scale =  "auto"; }
	    { output = "DP-4"; mode = "1280x1024@75.03Hz"; position = "3840x0"; scale = "auto"; }
    ];

	  workspace_rule = [
      { workspace = "3"; monitor = "DP-2";}
	    { workspace = "1"; monitor = "HDMI-A-3, default:true"; }
	    { workspace = "2"; monitor = "DP-3"; }
	    { workspace = "4"; monitor = "DP-4"; }
	  ];

	  env = [
	  	{ _args = [ "AQ_DRM_DEVICES" "/dev/dri/card1:/dev/dri/card2" ];}
	  	{ _args = [ "LIBVA_DRIVER_NAME" "nvidia" ];}
	  	{ _args = [ "__GLX_VENDOR_LIBRARY_NAME" "nvidia" ];}
	  ];

    config = {
      cursor.no_hardware_cursors = true;
	    misc.vrr = 1;
    };
  };
  services.hypridle.enable = lib.mkForce false;
}
