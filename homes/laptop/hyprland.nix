{ config, lib, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    monitor= [
      "eDP-1, 1920x1080@120, 0x0, 1"
      "HDMI-A-1, 1920x1080@60, auto, auto"
    ];
	env = [ "AQ_DRM_DEVICES,/dev/dri/card1"];
  };
}
