{ lib, ... }:

{
  wayland.windowManager.hyprland.settings = {
    config = {
      ecosystem = {
        no_update_news = true;
        no_donation_nag = true;
      };

      debug = {
        disable_logs = false;
        disable_time = false;
      };

      misc = {
        force_default_wallpaper = 1;
        disable_hyprland_logo = true;
        mouse_move_focuses_monitor = false;
      };

      decoration = {
        rounding = 10;
      
        shadow = {
	        enabled = true;
	        range = 4;
	        render_power = 3;
	        color = "rgba(1a1a1aee)";
	      };
      };

      general = {
        gaps_in = 2;
        gaps_out = 5;
        border_size = 1;
        "col.active_border" = lib.generators.mkLuaInline "{colors = {\"rgba(33ccffee)\", \"rgba(00ff99ee)\"}, angle = 45}";
        "col.inactive_border" = "rgba(595959aa)";
        resize_on_border = false;
        allow_tearing = false;
        layout = "dwindle";
      };

	    cursor = {
        no_warps = true;
        inactive_timeout = 3;
        hide_on_key_press = true;
      };

      animations = { enabled = true;};

      input = {
        kb_layout = "fr";
        kb_variant = "us";
        follow_mouse = 2;
        kb_options = "caps:none";
        touchpad.natural_scroll = false;
      };

      dwindle = {
  	    force_split = 2;
      };

    };
  };
}
