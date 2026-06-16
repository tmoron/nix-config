{lib, pkgs, ... }: 
{
  programs.waybar.settings.mainBar = {
    "custom/music" = {
      exec-if  = "${lib.getExe pkgs.playerctl} metadata 2>&1 >/dev/null";
      exec  = "${lib.getExe pkgs.playerctl} metadata --format '  {{ artist }} - {{title}}'";
      interval  = 1;
      interval-if  = 5;
	  max-length = 50;
    };
  };
}
