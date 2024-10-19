{ config, lib, pkgs, homeDir, ... }:

let
  background = "${homeDir}/.config/nitrogen/wallpaper.png";
in
{
  home.file.".config/nitrogen/bg-saved.cfg".text = ''
    [xin_0]
    file=${background}
    mode=5
    bgcolor=#000000
    
    [xin_1]
    file=${background}
    mode=5
    bgcolor=#000000
    
    [xin_2]
    file=${background}
    mode=5
    bgcolor=#000000
    
    [xin_3]
    file=${background}
    mode=5
    bgcolor=#000000
  '';
}
