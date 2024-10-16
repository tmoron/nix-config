
{ config, lib, inputs, pkgs, ... }:

{
  networking.hostName = "patate-douce";
  networking.wireless.enable = true;
  networking.networkmanager.enable = false;

  environment.systemPackages = with pkgs; [
    acpi
	tlp
  ];

  hardware.opengl = {
    enable = true;
	driSupport32Bit = true;
  };

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia.prime.offload = {
    enable = true;
	enableOffloadCmd = true;
  };
}
