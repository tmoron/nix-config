{ ... }:

{
  mods.game.enable = false;
  mods.hyprland.enable = false;
  mods.x11.enable = true;
  programs.firefox.enable = false;

  services.picom = {
    backend = "xrender";
    settings = {
      blur = {
        method = "none";
		size = 0;
		deviation = 0.0;
	  };
    };
  };
}
