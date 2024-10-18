
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

#  services.xserver.videoDrivers = [ "intel"];

  boot.kernelModules = [ "kvm-intel" "nvidia" ];
  hardware.graphics.extraPackages = with pkgs; [libGL linuxPackages.nvidia_x11.out];


  hardware.nvidia = {
	open = true;

	prime.nvidiaBusId = "PCI:1:0:0";
	prime.intelBusId = "PCI:0:2:0";
	prime.sync.enable = true;

	modesetting.enable = true;
  };

  services.openssh.enable = true;

}
