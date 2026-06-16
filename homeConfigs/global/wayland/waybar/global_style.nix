{ ... }:
{
  programs.waybar.style = ''
    * {
      font-family: "Iosevka Nerd Font";
      font-size: 14px;
	  background-color: transparent;
    }

	.modules-right, #window {
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

    @keyframes red_blink {
      from { background-color: rgba(127, 132, 156, 0.6); }
      to   { background-color: rgba(193,89,118, 0.5); }
    }
    
    #custom-separator {
      background-color: transparent;
	  margin: 0px;
	  padding: 0px
    }

    #network, #clock {
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
}
