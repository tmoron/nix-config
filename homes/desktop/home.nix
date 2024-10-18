{ config, lib, pkgs, ... }:

{
  imports = [ ./nitrogen.nix ];
  home.file = {
    ".config/bspwm/screenlayout.sh".source = ./bspwm/screenlayout.sh;
  };
}
