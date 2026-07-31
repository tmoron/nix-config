{lib, pkgs, ... }:

{
  wayland.windowManager.hyprland.systemd.variables = [ "--all" ];

  programs.hyprshot.enable = true;
  catppuccin.hyprland.enable = false;
  home.shellAliases.hl = "Hyprland";

  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.configType = "lua";

  wayland.windowManager.hyprland.settings = {
    mod = { _var = "SUPER"; };

    env = [
	    { _args = [ "HYPRCURSOR_SIZE" "17" ]; }
      { _args = [ "HYPRCURSOR_THEME" "bibata-modern-classic" ];}
    ];
  };
}
