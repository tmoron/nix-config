{ lib, pkgs, ... }:

{
  programs.waybar.settings.mainBar = {
    modules-right = lib.mkBefore ["custom/fans" "custom/dgpu"];
    "custom/dgpu" = {
      exec-if  = "test \"$(supergfxctl -g)\" = \"Hybrid\" || test \"$(supergfxctl -g)\" = \"Vfio\"";
      exec  = "echo \"󰾲  on\"";
      interval-if  = 10;
      interval = 100;
    };

    "custom/fans" = {
      exec-if  = "test \"$(cat /sys/class/hwmon/hwmon6/fan1_input)\" -gt 0 -o \"$(cat /sys/class/hwmon/hwmon6/fan2_input)\" -gt 0";
      exec  = "echo \" \" \"$(($(cat /sys/class/hwmon/hwmon6/fan1_input) / 100)).$(($(cat /sys/class/hwmon/hwmon6/fan2_input) / 100))\"";
      interval  = 1;
      interval-if  = 1;
    };
  };

  wayland.windowManager.hyprland.settings = {
	  workspace_rule = [
        { workspace = "1"; monitor = "eDP-1"; }
	      { workspace = "2"; monitor = "HDMI-A-1"; default = true; }
    ];

    bind = [
      { _args = [
        "XF86Launch1"
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"hyprlock\")")
        ];}
      { _args = [
        "XF86Launch4"
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"pkill activate-linux\")")
        ];}
	  ];
    monitor= [
      { output = "DP-2"; mode = "1920x1080@60Hz"; position = "-1920x0"; scale="auto"; }
	    { output = "eDP-1"; mode = "1920x1080@120"; position = "0x0"; scale = "1"; }
      { output = "HDMI-A-1"; mode = "1920x1080@60"; position = "auto"; scale = "auto"; }
    ];
	  env = [ { _args = ["AQ_DRM_DEVICES" "/dev/dri/card1"]; } ];
  };

  home.packages = with pkgs; [
    blender
	  wireshark
  ];

  services.mpris-proxy.enable = true;
}
