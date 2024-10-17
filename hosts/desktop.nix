
{ config, lib, inputs, pkgs, ... }:

{
  imports = [
    modules/game.nix
	modules/nvidia.nix
	modules/vboxHost.nix
  ];

  networking.hostName = "nixos-fixe";
  networking.firewall.allowedTCPPorts = [ 5900 ];
  networking.firewall.allowedUDPPorts = [ 5900 ];

  hardware.cpu.intel.updateMicrocode = true;

  services.xserver.videoDrivers = [ "modesetting" "intel"];

  hardware.graphics.extraPackages = [ pkgs.mesa.drivers ];
  hardware.nvidia = {
	open = true;

	prime.nvidiaBusId = "PCI:1:0:0";
	prime.intelBusId = "PCI:0:2:0";
  };
}
