{ lib, pkgs, ... }:
{
  catppuccin = {
  	enable = true;
	flavor = "mocha";

	dunst.enable = true;
	dunst.flavor="frappe";

    kvantum.apply = true;
    rofi.enable = false;
  };

  gtk = {
    enable = true;
    theme = { package = pkgs.flat-remix-gtk; name = "Flat-Remix-GTK-Grey-Darkest"; };
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
    ".config/wallpaper.png".source = lib.mkDefault ../utils/wallpaper.png;
    ".config/lock_screen.jpg".source = lib.mkDefault ../utils/lock_screen.jpg;
  };
}
