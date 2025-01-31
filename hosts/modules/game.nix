{ config, lib, inputs, pkgs, ... }:

{
  programs.steam.enable=true; 
  programs.steam.protontricks.enable=true;

#  environment.systemPackages = with pkgs; [ qemu quickemu];
#  programs.virt-manager.enable = true;
#  virtualisation.libvirtd.enable = true;
}
