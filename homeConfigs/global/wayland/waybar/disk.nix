{ ... }:
{
  programs.waybar.settings.mainBar = {
    disk = {
      format-low ="";
	  format = "󰋊 {percentage_used}%";
	  states.low = 0;
  	  states.warning = 70;
  	  states.high= 90;
    };
  };
}
