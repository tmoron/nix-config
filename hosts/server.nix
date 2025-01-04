
{ config, lib, inputs, pkgs, ... }:

{
  imports = [
  	modules/game.nix
	modules/vboxHost.nix
	modules/nvidia.nix
  ];

  networking.hostName = "server";
  services.openssh.enable = true;

  environment.systemPackages = with pkgs; [
  	zfs
  ];
  boot.supportedFilesystems = [ "zfs" ];

  networking.firewall.allowedTCPPorts = [80 443 5000 8083];
  networking.firewall.allowedUDPPorts = [80 443 5000 8083];

  networking = {
    interfaces.eth0.ipv4.addresses = [ {
      address = "192.168.1.24";
	  prefixLength = 24;
    } ];
	defaultGateway = "192.168.1.254";
	nameservers = ["8.8.8.8" "8.8.4.4" "1.1.1.1"];
  	hostId = "68290da7";
  };
  virtualisation.docker.liveRestore = false;
  virtualisation.docker.enableOnBoot = true;

  services.fail2ban.enable = true;
  services.fail2ban.bantime = "2h";

  hardware.nvidia-container-toolkit.enable = true;

  hardware.nvidia = {
	open = false;

#	prime.nvidiaBusId = "PCI:1:0:0";
#	prime.amdgpuBusId = "PCI:13:0:0";
#	prime.sync.enable = true;

#	modesetting.enable = true;
  };
}
