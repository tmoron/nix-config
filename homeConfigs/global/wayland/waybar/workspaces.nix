{ ... }:
{
  programs.waybar.style = ''
	#workspaces {
      border: 1px solid #444444;
      background-color: #1e1e2e;
      padding-left: 3px;
      padding-right: 3px;
      padding-top: 2px;
      padding-bottom: 2px;
      border-radius: 10px;
    }

    #workspaces button {
      background-color: transparent;
      padding: 0px 3px;
      margin: 0px 5px;
      min-height: 0px;
    }
    
    #workspaces button.active {
      background-color: rgba(127, 132, 156, 0.6);
    }

    #workspaces button.urgent { 
      animation: red_blink 500ms infinite alternate; 
      color: #ffffff;
    }

	window#waybar.empty #window {
      background-color: transparent;
	  border: none;
    }
  '';
  programs.waybar.settings.mainBar = {
    "hyprland/workspaces" = {
      disable-scroll = true;
      all-outputs = false;
      format = "{id}";
    };
  };
}
