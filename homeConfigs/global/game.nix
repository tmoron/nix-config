{ pkgs, ... }:
{
  home.packages = with pkgs;[
    lutris
    mangohud
    moonlight-qt
    prismlauncher
  
    r2modman
  ];
}
