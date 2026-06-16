{ pkgs, lib, ... }:

{
  programs.waybar.enable = true;
  /*

	.modules-right {
      background-color: #1e1e2e;
      padding-left: 10px;
      padding-right: 10px;
      padding-top: 5px;
      padding-bottom: 5px;
      border-radius: 10px;
    }
  */
  programs.waybar.style = ''
    * {
      font-family: "Iosevka Nerd Font";
      font-size: 14px;
    }

	.modules-right {
      border: 1px solid #444444;
      background-color: #1e1e2e;
      padding-left: 10px;
      padding-right: 10px;
      padding-top: 3px;
      padding-bottom: 3px;
      border-radius: 10px;
    }
    
    .modules-right .module {
      margin-left: 4px;
      margin-right: 4px;
      background-color: rgba(127, 132, 156, 0.3);
	  padding: 1px 6px;
      border-radius: 5px;
      color: #cdd6f4;

	  transition: background-color 200ms ease;
    }

    #window {
      font-weight: bold;
    }

    #custom-separator {
      background-color: transparent;
	  margin: 0px;
	  padding: 0px
    }

    #workspaces button {
      padding: 0 5px;
      background: transparent;
      color: white;
      border-top: 2px solid transparent;
    }
    
    #workspaces button.focused {
      color: #c9545d;
      border-top: 2px solid #c9545d;
    }

    #workspaces button.active {
    	color : #88ff88;
    	background-color : rgba(220,255, 220, 0.3)
    }

    #network {
      background-color: transparent;
	}

	#clock { 
	  background-color: transparent;
	}
    
    #network.disconnected {
      color: #f53c3c;
      font-weight:bold;
    }

	.module.warning {
      background-color: rgba(249, 226, 175, 0.4);
	  color: #ffffff;
	}

    .module.high, .module.critical {
	  background-color: rgba(193,89,118, 0.5);
	  color: #ffffff;
	}
  '';

  programs.waybar.settings.mainBar = {
    layer  = "top";
    position ="top";
    height = 24;
    margin-left = 5;
    margin-right = 5;
    modules-left = ["hyprland/workspaces" "custom/music"];
    modules-center = ["hyprland/window"];
    modules-right = ["disk" "pulseaudio" "cpu" "temperature" "memory" "battery" "network" "custom/separator" "clock"];

	"hyprland/window" = {
		max-length = 50;	
	};

    "hyprland/workspaces" = {
      disable-scroll = true;
      all-outputs = false;
      format = "{id}";
    };
  
    clock = {
      interval  = 1;
      format-alt = "{:%Y-%m-%d}";
      format  = "{:%H:%M:%S}";
    };
  
    cpu = {
      format = "  {usage}%";
	  format-low = "";
  	  states = {
		  low = 0;
		  working = 20;
		  high = 80;
	  };
  	  interval = 5;
    };
  
    memory = {
      format = "  {}%";
	  format-low = "";
      interval = 5;
	  states = {
		low = 0;
		show = 50;
		elevated = 80;
		critical = 95;
	  };
    };
  
    battery = {
      bat = "BAT0";
  	  full-at = 79;
      states = {
        good = 20;
        critical = 15;
      };
      format-time = " {H}:{m}";
      format-discharging = "{icon} {capacity}%{time}";
  	  format-charging = " {capacity}%{time}";
  	  format-plugged = "";
      format-icons = [" " " " " " " " " "];
      interval = 10;
    };

    network = {
      format-wifi = "{icon} {essid}";
      format-ethernet = "󰈁 {ifname}";
      format-disconnected = "⚠ Disconnected";
      format-icons = ["󰤟 " "󰤢 " "󰤥 " "󰤨 "];
	  max-length = 20;
    };

    pulseaudio = {
      format = "{icon}{volume}%";
      format-bluetooth = " {icon} {volume}%";
      format-muted = "";
      format-icons = {
        headphones = " ";
        handsfree = "󰋎 ";
        headset = "󰋎 ";
        phone = " ";
        portable = " ";
        car = " ";
        default = [" " " " "  "];
      };
      on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
	  states = {
		low = 79;
		warning = 99;
		high = 100000;
	  };
    };

    temperature = {
      thermal-zone = lib.mkDefault 0;
      critical-threshold = lib.mkDefault 85;
	  warning-threshold = lib.mkDefault 60;
      interval = 5;
	  format = "";
      format-warning ="{icon} {temperatureC}°C";
      format-critical ="{icon} {temperatureC}°C";
      format-icons = ["" "" "" "" ""];
    };

    disk = {
      format-low ="";
	  format = "󰋊 {percentage_used}%";
	  states.low = 0;
  	  states.warning = 20;
  	  states.high= 30;
    };

	"custom/separator" = {
	  format = "|";
	};
  
    "custom/music" = {
      exec-if  = "playerctl metadata 2>&1 >/dev/null";
      exec  = "playerctl metadata --format '  {{ artist }} - {{title}}'";
      interval  = 1;
      interval-if  = 5;
	  max-length = 50;
    };

  };
}
