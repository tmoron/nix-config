
{ config, lib, inputs, pkgs, ... }:

{
  imports = [
    modules/game.nix
	modules/nvidia.nix
  ];

  networking.hostName = "nixos-fixe";
}
