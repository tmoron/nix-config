{ config, lib, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    bind = [
      #lock
      ", XF86Launch1, exec, hyprlock"
      ", XF86Launch4, exec, pkill activate-linux"
	];
    monitor= [
      "eDP-1, 1920x1080@120, 0x0, 1"
      "HDMI-A-1, 1920x1080@60, auto, auto"
    ];
	env = [ "AQ_DRM_DEVICES,/dev/dri/card1"];
  };
}
