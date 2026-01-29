{ lib, pkgs, ... }:

{
  programs.waybar.settings.mainBar = {
    modules-right = lib.mkBefore ["custom/fans" "custom/dgpu"];
    "custom/dgpu" = {
      exec-if  = "test \"$(supergfxctl -g)\" = \"Hybrid\" || test \"$(supergfxctl -g)\" = \"Vfio\"";
      exec  = "echo \"   on |\"";
      interval-if  = 10;
      interval = 100;
    };

    "custom/fans" = {
      exec-if  = "test \"$(cat /sys/class/hwmon/hwmon6/fan1_input)\" -gt 0 -o \"$(cat /sys/class/hwmon/hwmon6/fan2_input)\" -gt 0";
      exec  = "echo \" \" \"$(cat /sys/class/hwmon/hwmon6/fan1_input).$(cat /sys/class/hwmon/hwmon6/fan2_input) |\"";
      interval  = 1;
      interval-if  = 1;
    };
  };

  wayland.windowManager.hyprland.settings = {
	workspace = [
      "1, monitor:eDP-1"
	  "2, monitor:HDMI-A-1, default:true"
    ];
    bind = [
      ", XF86Launch1, exec, hyprlock"
      ", XF86Launch4, exec, pkill activate-linux"
	];
	bindl = [
     ",switch:off:Lid Switch,exec,hyprctl keyword monitor \"eDP-1, 1920x1080@120, 0x0, 1\""
     ",switch:on:Lid Switch,exec,hyprctl keyword monitor \"eDP-1, disable\""

	];
    monitor= [
#      "eDP-1, modeline 173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync, 0x0, 1"
	  "eDP-1, 1920x1080@120, 0x0, 1"
      "HDMI-A-1, 1920x1080@60, auto, auto"
    ];
	env = [ "AQ_DRM_DEVICES,/dev/dri/card1"];
  };

  home.packages = with pkgs; [
    blender
	wireshark
	localsend
	impala
  ];

}
