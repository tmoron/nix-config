# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    polybar.nix                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/02/10 02:51:32 by tomoron           #+#    #+#              #
#    Updated: 2025/08/05 14:50:41 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ lib, config, ... }:

{
  config = lib.mkIf config.mods.x11.enable {
    services.polybar.enable = true;
    services.polybar.script = "pgrep polybar >/dev/null || polybar -q main -c \"$HOME/.config/polybar/config.ini\"&";
	services.polybar.config = {
      "global/wm" = {
        margin-bottom = 0;
        margin-top = 0;
	  };
        
      color = {
        background = "#AA111111";
        foreground = "#CCCCCC";
        foreground-alt = "#FFFFFF";
        alpha = "#00000000";
        
        shade1 = "#AAFFFFFF";
        shade2 = "#AAFF0000";
	  };

      "module/memory" = {
        type = "internal/memory";
        interval = 1;
        format = "<label>";
        format-prefix = "";
        format-prefix-font = 2;
        format-padding = 1;
        label = "  %percentage_used%%";
	  };

      "module/filesystem" = {
        type = "internal/fs";
        mount-0 = "/home/tomoron";
        interval = 10;
        fixed-values = true;
        format-mounted = "<label-mounted>";
        format-mounted-prefix = "󰋊";
        format-mounted-prefix-font = 2;
        format-mounted-padding = 2;
        label-mounted = " %percentage_used%%";
        label-unmounted = " %mountpoint%: not mounted";
  	  };
  
      "module/cpu" = {
        type = "internal/cpu";
        interval = 1;
        format = "<label>";
        format-prefix = " ";
        format-prefix-font = 2;
        format-foreground = "\${color.foreground}";
        format-padding = 1;
        label = " %percentage%%";
  	  };
  
      "module/temperature" = {
        type = "internal/temperature";
        interval = 1;
        thermal-zone = 0;
        hwmon-path = "/sys/devices/virtual/thermal/thermal_zone0/temp";
        warn-temperature = 80;
        units = true;
        format = "<ramp> <label>";
        format-padding = 1;
        format-warn = "<ramp> <label-warn>";
        format-warn-foreground = "#FF0000";
        format-warn-padding = 1;
        label = "%temperature-c%";
        label-warn = "%temperature-c%";
        ramp-0 = "";
        ramp-1 = "";
        ramp-2 = "";
        ramp-3 = "";
        ramp-4 = "";
        ramp-font = 2;
      };
  	
      "module/sep" = {
        type = "custom/text";
        content = "|";
        content-foreground = "#FFFFFF";
  	  };
  
      "module/space" = {
        type = "custom/text";
        content = "  ";
        content-padding=1;
  	  };
  
      "module/network" = {
        type = "internal/network";
        interface = "wlp2s0";
        interval = 1;
        accumulate-stats = true;
        unknown-as-up = true;
        format-connected = "<ramp-signal><label-connected>";
        format-connected-prefix = "";
        format-connected-prefix-font = 2;
        format-connected-padding = 1;
        format-disconnected = "<label-disconnected>";
        format-disconnected-prefix = "󱚼 ";
        format-disconnected-prefix-font = 2;
        format-disconnected-padding = 1;
        label-connected = "%{A1:networkmanager_dmenu &:} %essid%%{A}";
        label-disconnected = "%{A1:networkmanager_dmenu &:}%{A}";
        ramp-signal-0 = "󰤟 ";
        ramp-signal-1 = "󰤢 ";
        ramp-signal-2 = "󰤨 ";
  	  };
  
      "module/date" = {
        type = "internal/date";
        interval = 1;
        time = " %H:%M:%S";
        time-alt = " %a, %d %b %Y";
        format = "<label>";
        format-prefix = " ";
        format-prefix-font = 2;
        format-foreground = "\${color.foreground}";
        format-padding = 1;
        label = "%time%";
  	  };
  
      "module/workspaces" = {
        type = "internal/xworkspaces";
        pin-workspaces = false;
        enable-click = true;
        enable-scroll = false;
        icon-0 = "1;1";
        icon-1 = "2;2";
        icon-2 = "3;3";
        icon-3 = "4;4";
        icon-4 = "5;5";
        icon-5 = "A;A";
        icon-6 = "B;B";
        icon-default = 0;
        format = "<label-state>";
        format-font = 3;
        format-background = "#0000FF";
        format-foreground = "#FF0000";
        label-monitor = "%name%";
        label-active = "%icon%";
        label-active-background = "#44ffffff";
        label-active-foreground = "#00FF00";
        label-occupied = "%icon%";
        label-occupied-background = "#00FFFFFF";
        label-occupied-foreground = "#00FF00";
        label-urgent = "%icon%";
        label-urgent-background = "\${color.background}";
        label-urgent-foreground = "#CC6666";
        label-empty = "%icon%";
        label-empty-background = "#0000FFFF";
        label-empty-foreground = "#FFFFFF";
        label-active-padding = "1.85";
        label-urgent-padding = "1.85";
        label-occupied-padding = "1.85";
        label-empty-padding = "1.85";
  	  };
  
      "module/mpris" = {
        type = "custom/script";
        exec-if = "playerctl metadata";
        exec = "playerctl metadata --format '{{ playerName }}:{{ artist }} - {{title}}'";
        interval = 1;
        interval-if = 1;
  	  };
  
      "bar/main" = {
        monitor = "\${env:MONITOR:}";
        monitor-fallback = "";
        monitor-strict = false;
        override-redirect = false;
        bottom = false;
        fixed-center = true;
        width = "100%";
        height = 40;
        offset-x = 0;
        offset-y = 0;
        background = "\${color.alpha}";
        foreground = "\${color.foreground}";
        radius-top = "0.0";
        radius-bottom = "0.0";
        underline-size = 2;
        underline-color = "\${color.foreground}";
        border-size = 0;
        border-color = "\${color.background}";
        padding = 0;
        module-margin-left = 0;
        module-margin-right = 0;
        font-0 = "Iosevka Nerd Font:style=Bold:pixelsize=13;4";
        font-1 = "Iosevka Nerd Font:style=Bold:pixelsize=15;4";
        font-2 = "Iosevka Nerd Font:style=Bold:pixelsize=15;4";
        modules-left = "workspaces space mpris";
        modules-center = "";
        modules-right = "memory sep filesystem sep cpu sep temperature sep network sep date";
        separator = "";
        dim-value = "1.0";
        tray-position = "none";
        tray-detached = false;
        tray-maxsize = 16;
        tray-background = "\${color.background}";
        tray-offset-x = 0;
        tray-offset-y = 0;
        tray-padding = 0;
        tray-scale = "1.0";
        enable-ipc = true;
  	  };
  
      settings = {
        throttle-output = 5;
        throttle-output-for = 10;
        screenchange-reload = false;
        
        compositing-background = "source";
        compositing-foreground = "over";
        compositing-overline = "over";
        compositing-underline = "over";
        compositing-border = "over";
        
        pseudo-transparency = false;
  	  };
    };
  };
}
