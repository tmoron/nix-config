{ ... }:

{
  mods.x11.enable = true;
  wayland.windowManager.hyprland.settings = {
    monitor = [
	  "DP-1, 1280x1024@75.03Hz, -3200x0, auto"
      "HDMI-A-1, 1920x1080@60, -1920x0, auto"
	  "HDMI-A-3, 1920x1080@74.97Hz, 0x0, auto"
	  "DP-3, 1920x1080@60.00Hz, 1920x0, auto"
	  "DP-4, 1280x1024@75.03Hz, 3840x0, auto"
    ];
	workspace = [
      "4, monitor:DP-1"
      "3, monitor:HDMI-A-1"
	  "1, monitor:HDMI-A-3, default:true"
	  "2, monitor:DP-3"
	  "5, monitor:DP-4"
	];
	env = [
		"AQ_DRM_DEVICES,/dev/dri/card1:/dev/dri/card0"
		"LIBVA_DRIVER_NAME,nvidia"
		"__GLX_VENDOR_LIBRARY_NAME,nvidia"
	];
    cursor.no_hardware_cursors = true;
	misc.vrr = 1;
  };

  mods.hyprland.autoSuspend = false;
}
