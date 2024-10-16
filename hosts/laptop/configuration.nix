
{ config, lib, inputs, pkgs, ... }:

{
  networking.hostName = "patate-douce";
  networking.wireless.enable = true;
  networking.networkmanager.enable = false;

  environment.systemPackages = with pkgs; [
    acpi
  ]
}
