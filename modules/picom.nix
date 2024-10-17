{ config, lib, pkgs, username,homeDir, ... }:

{
  services.picom = {
    enable = true;
	package = pkgs.picom-pijulius;
    backend = lib.mkDefault "glx";
    vSync = true;
    settings = {
      blur = {
        method = lib.mkDefault "gaussian";
		size = lib.mkDefault 20;
		deviation = lib.mkDefault 5.0;
      };
	  corner-radius=20;
      rounded-corners-exclude = [
        "window_type = 'dock'"
	"class_g = 'Dunst'"
      ];
      blur-background-exclude = [
        "class_g = 'activate-linux'"
      ];
    };
  };
}
