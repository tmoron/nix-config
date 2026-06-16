{ ... }:
{
  programs.waybar.settings.mainBar = {
    cpu = {
      format = "  {usage}%";
	  format-low = "";
  	  states = {
		  low = 0;
		  working = 30;
		  high = 80;
	  };
  	  interval = 5;
    };
  };
}
