{ pkgs, ... }:
{
  home.packages = with pkgs;[
    #lutris #broken
    mangohud
    moonlight-qt
    prismlauncher
  
    r2modman
  ];
}
