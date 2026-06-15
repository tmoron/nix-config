{ pkgs, lib, config, ... }:

{
  home.packages = with pkgs; [
    grim
    slurp
    wl-clipboard
    swaybg
  ];
}
