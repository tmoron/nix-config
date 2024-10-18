{ config, lib, inputs, pkgs, ... }:

{
  virtualisation.virtualbox.host.enable = true;
  users.users.tom.extraGroups = [ "vboxusers" ];
}
