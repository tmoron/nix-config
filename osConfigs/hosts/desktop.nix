
{ config, lib, inputs, pkgs, ... }:

{
  boot.kernelParams = [ "nvidia-drm-modset=1" ];
  environment.systemPackages = with pkgs; [
  	cudatoolkit
  	lm_sensors
  ];

  networking.hostName = "nixos-fixe";

  hardware.cpu.intel.updateMicrocode = true;

  boot.kernelModules = [ "kvm-intel" "nvidia" ];
  mods.displayManager.enable = true;

  hardware.nvidia = {
  	package = config.boot.kernelPackages.nvidiaPackages.beta;
	open = true;

	prime.nvidiaBusId = "PCI:1:0:0";
	prime.intelBusId = "PCI:0:2:0";
	prime.sync.enable = true;

	modesetting.enable = true;
  };

  services.openssh.enable = true;
}
