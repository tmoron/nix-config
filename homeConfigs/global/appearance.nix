{ lib, pkgs, config, ... }:
{
  catppuccin = {
  	enable = true;
	autoEnable = false;

	flavor = "mocha";

	dunst.enable = true;
	dunst.flavor="frappe";

    kvantum.apply = true;
    rofi.enable = false;
  };

  gtk = {
    enable = true;
    theme = { package = pkgs.magnetic-catppuccin-gtk; name = "Catppuccin-GTK-Dark"; };
	gtk4.theme = config.gtk.theme;
    font = { name = "Sans"; size = 11; };
  };

  qt.style.name = "kvantum";

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  home.file = {
    ".config/wallpaper.png".source = lib.mkDefault ../assets/wallpaper.png;
    ".config/lock_screen.jpg".source = lib.mkDefault ../assets/lock_screen.jpg;
  };
}
