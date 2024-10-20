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

  networking.firewall.allowedTCPPorts = [ 5900 ];
  networking.firewall.allowedUDPPorts = [ 5900 ];

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
}
