{ ... }:
{
  programs.waybar.settings.mainBar = {
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
  };
}
