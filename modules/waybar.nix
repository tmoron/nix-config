{ config, lib, pkgs, username,homeDir, ... }:

{
  programs.waybar.enable = true;
  programs.waybar.style = ''
    * {
      border: none;
      border-radius: 0;
      font-family: "Iosevka Nerd Font";
      font-size: 15px;
      min-height: 0;
    }
    
    window#waybar {
      background: transparent;
      color: white;
    }
    
    #window {
      font-weight: bold;
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
    
    #mode {
      background: #64727D;
      border-bottom: 3px solid white;
    }
    
    #network.disconnected {
      color: #f53c3c;
      font-weight:bold;
    }
    
    #temperature.critical {
      color: #ff2222; 
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
    modules-right = ["custom/fans" "custom/dgpu" "disk" "pulseaudio" "network" "cpu" "temperature" "custom/pipe" "memory" "battery" "clock"];
  
    "hyprland/workspaces" = {
      disable-scroll = true;
      all-outputs = false;
      format = "{id}";
    };
  
    clock = {
      interval  = 1;
      format-alt = " {:%Y-%m-%d}";
      format  = " {:%H:%M:%S}";
    };
  
    cpu = {
      format = "   {usage}% |";
    interval = 5;
    };
  
    memory = {
      format = "   {}% |";
      interval = 5;
    };
  
    battery = {
      bat = "BAT0";
      states = {
        good = 79;
        warning = 30;
        critical = 15;
      };
      format-time = " {H}:{m}";
      format = " {icon} {capacity}%{time} |";
      format-icons = [" " " " " " " " " "];
      interval = 10;
    };

    network = {
      format-wifi = " {icon} {essid} |";
      format-ethernet = "   {ifname}: {ipaddr}/{cidr} |";
      format-disconnected = " ⚠ Disconnected |";
      format-icons =["󰤟 " "󰤢 " "󰤥 " "󰤨 "];
    };

    pulseaudio = {
      format = " {icon}{volume}% |";
      format-bluetooth = "  {icon} {volume}% |";
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
      on-click = "pavucontrol";
    };

    temperature = {
      thermal-zone = 0;
      critical-threshold = 80;
      interval = 5;
      format =" {icon} {temperatureC}°C ";
      format-icons = ["" "" "" "" ""];
    };

    disk = {
      format =" 󰋊 {percentage_used}% |";
    };
    "custom/pipe" = {
      format = "|";
    };
  
    "custom/music" = {
      exec-if  = "playerctl metadata 2>&1 >/dev/null";
      exec  = "playerctl metadata --format '  {{ artist }} - {{title}}'";
      interval  = 1;
      interval-if  = 5;
    };

    "custom/dgpu" = {
      exec-if  = "test \"$(supergfxctl -g)\" = \"Hybrid\"";
      exec  = "echo \"   on |\"";
      interval-if  = 10;
      interval =100;
    };

    "custom/fans" = {
      exec-if  = "test \"$(cat /sys/class/hwmon/hwmon6/fan1_input)\" -gt 0 -o \"$(cat /sys/class/hwmon/hwmon6/fan2_input)\" -gt 0";
      exec  = "echo \" \" \"$(cat /sys/class/hwmon/hwmon6/fan1_input).$(cat /sys/class/hwmon/hwmon6/fan2_input) |\"";
      interval  = 1;
      interval-if  = 1;
    };
  };
}
