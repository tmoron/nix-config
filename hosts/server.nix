
{ config, lib, inputs, pkgs, ... }:

{
  imports = [
	modules/vboxHost.nix
  ];

  networking.hostName = "server";
  services.openssh.enable = true;

  networking.firewall.allowedTCPPorts = [80 443 5000];
  networking.firewall.allowedUDPPorts = [80 443 5000];

  networking = {
    interfaces.eth0.ipv4.addresses = [ {
      address = "192.168.1.24";
	  prefixLength = 24;
    } ];
	defaultGateway = "192.168.1.254";
	nameservers = ["8.8.8.8" "8.8.4.4" "1.1.1.1"];
  };
  virtualisation.docker.liveRestore = false;
}
