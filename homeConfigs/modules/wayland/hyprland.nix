{ config, lib, pkgs, ... }:

{
  options.mods.hyprland.enable = lib.mkOption {
    type = lib.types.bool;
	default = true;
	description = "install and configure hyprland and others";
  };

  config = lib.mkIf config.mods.hyprland.enable {
    wayland.windowManager.hyprland.systemd.variables = [ "--all" ];

    wayland.windowManager.hyprland.enable = true;
    wayland.windowManager.hyprland.settings = {
      "$mainMod" = "SUPER";
      bind = [
  	  " , Print, exec, grim -t png -g \"$(slurp)\" /dev/stdout | tee ~/screenshots/$(date +%Y-%m-%d_%H-%m-%s).png | wl-copy -t image/png"
        "$mainMod, Return, exec, alacritty"
        "CTRL_ALT, Q, killactive,"
        "CTRL_ALT_SHIFT, Q, forcekillactive,"
        "SUPER_ALT, Q, exit,"
        "$mainMod, S, togglefloating,"
        "$mainMod, I, pin,"
        "$mainMod, D, exec, rofi -show drun -show-icons"
        "$mainMod, M, fullscreen, 1"
        "$mainMod, F, fullscreen, 0"
  
        # Move focus
        "$mainMod, h, movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, k, movefocus, u"
        "$mainMod, j, movefocus, d"
  
        #swap windows
        "$mainMod SHIFT, h, swapwindow, l"
        "$mainMod SHIFT, l, swapwindow, r"
        "$mainMod SHIFT, k, swapwindow, u"
        "$mainMod SHIFT, j, swapwindow, d"
  
        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
  
        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
        "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
        "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
        "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
        "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
        "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
        "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
        "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
        "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
        "$mainMod SHIFT, 0, movetoworkspacesilent, 10"
  
        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
      ];
  
      bindm = [ #bind mouse
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
  
      bindel = [ #repeat and locked
        " ,XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        " ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        " ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        " ,XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        " ,XF86MonBrightnessUp, exec, brightnessctl s 10%+"
        " ,XF86MonBrightnessDown, exec, brightnessctl s 10%-"
        " ,XF86KbdBrightnessUp, exec, asusctl -n"
        " ,XF86KbdBrightnessDown, exec, asusctl -p"
      ];
  
      bindl = [ #repeat
        " , XF86AudioNext, exec, playerctl next"
        " , XF86AudioPrev, exec, playerctl previous"
        " , XF86AudioPause, exec, playerctl play-pause"
        " , XF86AudioPlay, exec, playerctl play-pause"
        "$mainMod, n, exec, playerctl next"
        "$mainMod, p, exec, playerctl previous"
		"$mainMod, o, exec, playerctl play-pause"
      ];
  
      windowrulev2 = [
        #ignore maximize requests
        "suppressevent maximize, class:.*"
        #fix dragging issues with xwayland
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];
  
      input = {
        kb_layout = "fr";
        kb_variant = "us";
        follow_mouse = 2;
        kb_options = "caps:none";
        touchpad.natural_scroll = false;
      };
  
      misc = {
        force_default_wallpaper = 1;
        disable_hyprland_logo = true;
	    mouse_move_focuses_monitor = false;
      };
  
      dwindle = {
        pseudotile = true;
		force_split = 2;
      };
  
      animations = {
        enabled = true;
  
        bezier = [
  	      "easeInOut, 0.77, 0, 0.175, 1"
          "easeOut, 0.24, 0.66, 0.04, 1"
  	    ];
      
        animation = [
  	      "windows, 1, 2, easeInOut"
          "windowsIn, 1, 2, easeInOut, slide"
          "windowsOut, 1, 2, easeInOut, slide"
          "fade, 1, 2, easeInOut"
          "workspaces, 1, 2, easeOut"
  	    ];
      };
  
      decoration = {
        rounding = 10;
      
        shadow = {
  	      enabled = true;
  	      range = 4;
  	      render_power = 3;
  	      color = "rgba(1a1a1aee)";
  	    };
      
        #blur = {
        #  enabled = true;
        #  size = 3;
        #  passes = 1;
        #  vibrancy = 0.1696;
        #};
      };
  
      general = {
        gaps_in = 2;
        gaps_out = 5;
        border_size = 1;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        resize_on_border = false;
        allow_tearing = false;
        layout = "dwindle";
      };
  
  	  cursor.no_warps = true;
  
      env = [
  	    "HYPRCURSOR_SIZE,17"
        "HYPRCURSOR_THEME,bibata-modern-classic"
      ];
  
  	  exec-once = [
          "swaybg -i ~/.config/wallpaper.png&"
          "(sleep 2;activate-linux)&"
          "waybar&"
          "alacritty&"
  	    ];
     };
  };
}
