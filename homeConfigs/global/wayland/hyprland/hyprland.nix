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
    bind = [
      { _args = [
          "Print"
          (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"hyprshot -m region -o ~/screenshots -f $(date +%Y-%m-%d_%H-%M-%S).png\")")
        ]; }
      { _args = [
          "SHIFT + Print"
          (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"hyprshot -m output -m active -o ~/screenshots -f $(date +%Y-%m-%d_%H-%M-%S).png\")")
        ]; }
      { _args = [
          (lib.generators.mkLuaInline "mod .. \" + Return\"")
          (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"alacritty\")")
        ]; }
      { _args = [
        "CTRL + ALT + Q"
        (lib.generators.mkLuaInline "hl.dsp.window.close()")
        ];}

      { _args = [
        "CTRL + ALT + SHIFT + Q"
        (lib.generators.mkLuaInline "hl.dsp.window.kill()")
        ];}

      { _args = [
        (lib.generators.mkLuaInline "mod .. \" + ALT + Q\"")
        (lib.generators.mkLuaInline "hl.dsp.exit()")
        {long_press = true; }
        ];}

      { _args = [
        (lib.generators.mkLuaInline "mod .. \" + S\"")
        (lib.generators.mkLuaInline "hl.dsp.window.float({action = \"toggle\"})")
        ];}

      { _args = [
        (lib.generators.mkLuaInline "mod .. \" + I\"")
        (lib.generators.mkLuaInline "hl.dsp.window.pin({action = \"toggle\"})")
        ];}

      { _args = [
        (lib.generators.mkLuaInline "mod .. \" + D\"")
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${lib.getExe pkgs.rofi} -show drun -show-icons\")")
        ];}
      { _args = [
        (lib.generators.mkLuaInline "mod .. \" + SHIFT + D\"")
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${lib.getExe pkgs.rofi} -show run -show-icons\")")
        ];}

      { _args = [
        (lib.generators.mkLuaInline "mod .. \" + M\"")
        (lib.generators.mkLuaInline "hl.dsp.window.fullscreen({mode = \"maximized\", action = \"toggle\"})")
        ];}
      { _args = [
        (lib.generators.mkLuaInline "mod .. \" + F\"")
        (lib.generators.mkLuaInline "hl.dsp.window.fullscreen({mode = \"fullscreen\", action = \"toggle\"})")
        ];}

      # Move focus
      { _args = [
        (lib.generators.mkLuaInline "mod .. \" + H\"")
        (lib.generators.mkLuaInline "hl.dsp.focus({direction = \"l\"})")
        ];}
      { _args = [
        (lib.generators.mkLuaInline "mod .. \" + L\"")
        (lib.generators.mkLuaInline "hl.dsp.focus({direction = \"r\"})")
        ];}
      { _args = [
        (lib.generators.mkLuaInline "mod .. \" + K\"")
        (lib.generators.mkLuaInline "hl.dsp.focus({direction = \"u\"})")
        ];}
      { _args = [
        (lib.generators.mkLuaInline "mod .. \" + J\"")
        (lib.generators.mkLuaInline "hl.dsp.focus({direction = \"d\"})")
        ];}

      #swap windows
      { _args = [
        (lib.generators.mkLuaInline "mod .. \" + SHIFT + H\"")
        (lib.generators.mkLuaInline "hl.dsp.window.swap({direction = \"l\"})")
        ];}
      { _args = [
        (lib.generators.mkLuaInline "mod .. \" + SHIFT + L\"")
        (lib.generators.mkLuaInline "hl.dsp.window.swap({direction = \"r\"})")
        ];}
      { _args = [
        (lib.generators.mkLuaInline "mod .. \" + SHIFT + K\"")
        (lib.generators.mkLuaInline "hl.dsp.window.swap({direction = \"u\"})")
        ];}
      { _args = [
        (lib.generators.mkLuaInline "mod .. \" + SHIFT + J\"")
        (lib.generators.mkLuaInline "hl.dsp.window.swap({direction = \"d\"})")
        ];}

      # Switch workspaces with mainMod + [0-9]
      { _args = [
        (lib.generators.mkLuaInline "mod .. \" + 1\"")
        (lib.generators.mkLuaInline "hl.dsp.focus({workspace = \"1\"})")
        ];}
      { _args = [
        (lib.generators.mkLuaInline "mod .. \" + 2\"")
        (lib.generators.mkLuaInline "hl.dsp.focus({workspace = \"2\"})")
        ];}
      { _args = [
        (lib.generators.mkLuaInline "mod .. \" + 3\"")
        (lib.generators.mkLuaInline "hl.dsp.focus({workspace = \"3\"})")
        ];}
      { _args = [
        (lib.generators.mkLuaInline "mod .. \" + 4\"")
        (lib.generators.mkLuaInline "hl.dsp.focus({workspace = \"4\"})")
        ];}
      { _args = [
        (lib.generators.mkLuaInline "mod .. \" + 5\"")
        (lib.generators.mkLuaInline "hl.dsp.focus({workspace = \"5\"})")
        ];}
      { _args = [
        (lib.generators.mkLuaInline "mod .. \" + 6\"")
        (lib.generators.mkLuaInline "hl.dsp.focus({workspace = \"6\"})")
        ];}
      { _args = [
        (lib.generators.mkLuaInline "mod .. \" + 7\"")
        (lib.generators.mkLuaInline "hl.dsp.focus({workspace = \"7\"})")
        ];}
      { _args = [
        (lib.generators.mkLuaInline "mod .. \" + 8\"")
        (lib.generators.mkLuaInline "hl.dsp.focus({workspace = \"8\"})")
        ];}
      { _args = [
        (lib.generators.mkLuaInline "mod .. \" + 9\"")
        (lib.generators.mkLuaInline "hl.dsp.focus({workspace = \"9\"})")
        ];}
      { _args = [
        (lib.generators.mkLuaInline "mod .. \" + 0\"")
        (lib.generators.mkLuaInline "hl.dsp.focus({workspace = \"10\"})")
        ];}

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      { _args = [
        (lib.generators.mkLuaInline "mod .. \" + SHIFT + 1\"")
        (lib.generators.mkLuaInline "hl.dsp.window.move({workspace = \"1\", follow = false})")
        ];}
      { _args = [
        (lib.generators.mkLuaInline "mod .. \" + SHIFT + 2\"")
        (lib.generators.mkLuaInline "hl.dsp.window.move({workspace = \"2\", follow = false})")
        ];}
      { _args = [
        (lib.generators.mkLuaInline "mod .. \" + SHIFT + 3\"")
        (lib.generators.mkLuaInline "hl.dsp.window.move({workspace = \"3\", follow = false})")
        ];}
      { _args = [
        (lib.generators.mkLuaInline "mod .. \" + SHIFT + 4\"")
        (lib.generators.mkLuaInline "hl.dsp.window.move({workspace = \"4\", follow = false})")
        ];}
      { _args = [
        (lib.generators.mkLuaInline "mod .. \" + SHIFT + 5\"")
        (lib.generators.mkLuaInline "hl.dsp.window.move({workspace = \"5\", follow = false})")
        ];}
      { _args = [
        (lib.generators.mkLuaInline "mod .. \" + SHIFT + 6\"")
        (lib.generators.mkLuaInline "hl.dsp.window.move({workspace = \"6\", follow = false})")
        ];}
      { _args = [
        (lib.generators.mkLuaInline "mod .. \" + SHIFT + 7\"")
        (lib.generators.mkLuaInline "hl.dsp.window.move({workspace = \"7\", follow = false})")
        ];}
      { _args = [
        (lib.generators.mkLuaInline "mod .. \" + SHIFT + 8\"")
        (lib.generators.mkLuaInline "hl.dsp.window.move({workspace = \"8\", follow = false})")
        ];}
      { _args = [
        (lib.generators.mkLuaInline "mod .. \" + SHIFT + 9\"")
        (lib.generators.mkLuaInline "hl.dsp.window.move({workspace = \"9\", follow = false})")
        ];}
      { _args = [
        (lib.generators.mkLuaInline "mod .. \" + SHIFT + 0\"")
        (lib.generators.mkLuaInline "hl.dsp.window.move({workspace = \"0\", follow = false})")
        ];}

      #mouse binds
      { _args = [
        (lib.generators.mkLuaInline "mod .. \" + mouse:272\"")
        (lib.generators.mkLuaInline "hl.dsp.window.drag()")
        {mouse = true;}
        ];}
      { _args = [
        (lib.generators.mkLuaInline "mod .. \" + mouse:273\"")
        (lib.generators.mkLuaInline "hl.dsp.window.resize()")
        {mouse = true;}
        ];}


      #repeat and work while locked
      { _args = [
        "XF86AudioRaiseVolume"
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+\")")
        {locked = true; repeating = true; }
        ];}

      { _args = [
        "XF86AudioLowerVolume"
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-\")")
        {locked = true; repeating = true; }
        ];}
      { _args = [
        "XF86AudioMute"
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle\")")
        {locked = true; repeating = true; }
        ];}

      { _args = [
        "XF86AudioMicMute"
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle\")")
        {locked = true; repeating = true; }
        ];}

      { _args = [
        "XF86MonBrightnessUp"
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"brightnessctl s 10%+\")")
        {locked = true; repeating = true; }
        ];}
        
      { _args = [
        "XF86MonBrightnessDown"
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"brightnessctl s 10%-\")")
        {locked = true; repeating = true; }
        ];}

      { _args = [
        "XF86KbdBrightnessUp"
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"asusctl -n\")")
        {locked = true; repeating = true; }
        ];}

      { _args = [
        "XF86KbdBrightnessDown"
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"asusctl -p\")")
        {locked = true; repeating = true; }
        ];}

      { _args = [
        "XF86AudioNext"
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${lib.getExe pkgs.playerctl} next\")")
        {locked = true; }
        ];}

      { _args = [
        "XF86AudioPrev"
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${lib.getExe pkgs.playerctl} previous\")")
        {locked = true;}
        ];}

      { _args = [
        "XF86AudioPause"
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${lib.getExe pkgs.playerctl} pause\")")
        {locked = true;}
        ];}

      { _args = [
        "XF86AudioPlay"
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${lib.getExe pkgs.playerctl} play\")")
        {locked = true;}
        ];}

      { _args = [
        (lib.generators.mkLuaInline "mod .. \" + N\"")
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${lib.getExe pkgs.playerctl} next\")")
        {locked = true;}
        ];}

      { _args = [
        (lib.generators.mkLuaInline "mod .. \" + P\"")
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${lib.getExe pkgs.playerctl} previous\")")
        {locked = true;}
        ];}

      { _args = [
        (lib.generators.mkLuaInline "mod .. \" + O\"")
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${lib.getExe pkgs.playerctl} play-pause\")")
        {locked = true;}
        ];}
    ];

    window_rule = [
      { _args = [
        {match = { class = "(pinentry-)(.*)"; };}
        {stay_focused = true;}
      ];}
    ];

    curve = [
      { _args = [
        "easeInOut"
        {
          type = "bezier";
          points = lib.generators.mkLuaInline "{ {0.77, 0}, {0.175, 1} }";
        }
      ];}

      { _args = [
        "easeOut"
        {
          type = "bezier";
          points = lib.generators.mkLuaInline "{ {0.24, 0.66}, {0.04, 1} }";
        }
      ];}
    ];

    animation = [
      {leaf = "windows"; enabled = true; speed = 2; bezier = "easeInOut";}
      {leaf = "windowsIn"; enabled = true; speed = 2; bezier = "easeInOut"; style = "slide";}
      {leaf = "windowsOut"; enabled = true; speed = 2; bezier = "easeInOut"; style = "slide";}
      {leaf = "fade"; enabled = true; speed = 2; bezier = "easeInOut";}
      {leaf = "workspaces"; enabled = true; speed = 2; bezier = "easeOut";}
	  ];

    config = {

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
	    cursor.no_warps = true;
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

    layer_rule = [
      { _args = [
  	    {
          name = "no_anim_for_selection";
          no_anim = true;
          match = { namespace = "selection"; };
        }
      ];}
    ];

    env = [
	    { _args = [ "HYPRCURSOR_SIZE" "17" ]; }
      { _args = [ "HYPRCURSOR_THEME" "bibata-modern-classic" ];}
    ];

    on = {
      _args  = [
        "hyprland.start"
        (lib.generators.mkLuaInline ''function()
          hl.exec_cmd("${lib.getExe pkgs.swaybg} -i ~/.config/wallpaper.png")
          hl.exec_cmd("(sleep 2;${lib.getExe pkgs.activate-linux})")
          hl.exec_cmd("alacritty")
          hl.exec_cmd("waybar")
        end
        '')
      ];
    };
  };
}
