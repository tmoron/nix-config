{ config, lib, inputs, pkgs, ... }:

{
  imports = [
    modules/game.nix
	modules/nvidia.nix
	modules/vboxHost.nix
  ];
  networking.hostName = "patate-douce";
  networking.wireless.enable = true;
  networking.networkmanager.enable = false;

  networking.firewall.allowedTCPPorts = [ 11470 12470 80 ];
  networking.firewall.allowedUDPPorts = [ 11470 12470 80 ];

  environment.systemPackages = with pkgs; [
    acpi
	tlp
  ];

  hardware.nvidia.prime.offload = {
    enable = true;
	enableOffloadCmd = true;
  };

  services.libinput.enable = true;
  services.libinput.touchpad.clickMethod = "clickfinger";
  services.libinput.touchpad.tapping = false;

  hardware.bluetooth.enable = true;
}
