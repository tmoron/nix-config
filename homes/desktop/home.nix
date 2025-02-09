{ ... }:

{
  imports = [ 
    ../modules/nitrogen.nix
	./hyprland.nix
  ];

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
  };

  home.file = {
    ".config/bspwm/screenlayout.sh".source = ./bspwm/screenlayout.sh;
    ".config/bspwm/host.sh".source = ./bspwm/host.sh;
  };
}
