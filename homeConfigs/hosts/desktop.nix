{ ... }:

{
  mods.x11.enable = true;
  wayland.windowManager.hyprland.settings = {
    monitor = [
	  "HDMI-A-1, 1920x1080@60, 0x0, auto"
      "HDMI-A-3, 1920x1080@60, 1920x0, auto"
	  "DP-1, 1280x1024@60, 3840x0, auto"
	  "DP-3, 1280x1024@60, 5120x0, auto"
    ];
	workspace = [
      "1, monitor:HDMI-A-1"
	  "2, monitor:HDMI-A-3, default:true"
	  "3, monitor:DP-1"
	  "4, monitor:DP-3"
	];
	env = [
		"AQ_DRM_DEVICES,/dev/dri/card1:/dev/dri/card0"
		"LIBVA_DRIVER_NAME,nvidia"
		"__GLX_VENDOR_LIBRARY_NAME,nvidia"
	];
    cursor.no_hardware_cursors = 1;
  };
}
