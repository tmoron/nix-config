{ lib, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    on = [
      { _args  = [
        "hyprland.start"
        (lib.generators.mkLuaInline ''function()
          hl.exec_cmd("${lib.getExe pkgs.swaybg} -i ~/.config/wallpaper.png")
          hl.exec_cmd("(sleep 2;${lib.getExe pkgs.activate-linux})")
          hl.exec_cmd("waybar")

          hl.exec_cmd("firefox", { workspace = "3" })
          hl.exec_cmd("alacritty", { workspace = "1" })
        end
        '')
      ]; }
    ];
  };
}
