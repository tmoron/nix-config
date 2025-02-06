
{ config, lib, inputs, pkgs, ... }:

{
  imports = [
  	modules/game.nix
	modules/vboxHost.nix
	modules/nvidia.nix
  ];
  boot.kernelPackages = pkgs.linuxPackages;
  boot.extraModulePackages = with config.boot.kernelPackages; [gasket];

  networking.hostName = "server";
  services.openssh.enable = true;

  services.xserver.videoDrivers = [ "nvidia" ];

  boot.extraModprobeConfig = ''
    options amdgpu virtual_display=1
  '';

  environment.systemPackages = with pkgs; [
  	zfs
	nvidia-docker
	libnvidia-container
	screen
  ];
  boot.supportedFilesystems = [ "zfs" ];

  networking.firewall.allowedTCPPorts = [
  	80 443 #http server
	5000 #frigate
	8083 137 138 139 445 548 3702 5357 #prob some samba shit
  ];
  networking.firewall.allowedUDPPorts = [
  	80 443 #http server
	5000 #frigate
	8083 137 138 139 445 548 3702 5357 #prob some samba shit
  ];

  networking.firewall.allowedUDPPortRanges = [
	{from = 47950; to = 49000;}
  ];
  networking.firewall.allowedTCPPortRanges = [
	{from = 47950; to = 49000;}
  ];

  networking = {
    interfaces.eth0.ipv4.addresses = [ {
      address = "192.168.1.24";
	  prefixLength = 24;
    } ];
	defaultGateway = "192.168.1.254";
	nameservers = ["8.8.8.8" "8.8.4.4" "1.1.1.1"];
  	hostId = "68290da7";
  };
  virtualisation.docker = {
    liveRestore = false;
    enableOnBoot = true;
#    daemon.settings = {
#      runtimes.nvidia.path = "${pkgs.nvidia-docker}/bin/nvidia-container-runtime";
#      exec-opts = ["native.cgroupdriver=cgroupfs"];
#    };

  };

  services.fail2ban.enable = true;
  services.fail2ban.bantime = "2h";

  hardware.nvidia-container-toolkit.enable = true;

  hardware.nvidia = {
	open = true;

	prime.nvidiaBusId = "PCI:1:0:0";
	prime.amdgpuBusId = "PCI:13:0:0";
	prime.sync.enable = true;

	modesetting.enable = true;
  };
}
