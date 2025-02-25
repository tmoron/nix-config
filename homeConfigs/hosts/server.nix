{ config, lib, pkgs, ... }:

{
  mods.bash.goback = false;
  wayland.windowManager.hyprland.settings = {
    monitor= [
      "virt-1, 1920x1080@60, 0x0, 1.0"
	];

	env = ["WLR_BACKENDS,headless"];
  };
}
