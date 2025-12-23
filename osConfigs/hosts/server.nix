# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    server.nix                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/09/06 00:57:09 by tomoron           #+#    #+#              #
#    Updated: 2025/12/16 20:00:04 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ config, pkgs, ... }:

let
  ports = [
    22 #git ssh
    80 443 #http server
    5000 #frigate
    8083 137 138 139 445 548 3702 5357 #prob some samba shit
    24454 #minecraft voice chat
    25565 # minecraft server
  ];
  portRanges = [
    {from = 47950; to = 49000;} #moonlight (wolf)
  ];
in
{
  boot.kernelPackages = pkgs.linuxPackages;
  boot.extraModulePackages = [
    config.boot.kernelPackages.gasket #driver for google coral edge tpu
  ];


  services.openssh.enable = true;
  services.openssh.settings.PasswordAuthentication = false;
  services.openssh.ports = [ 1880 ];

  sops.secrets."cloudflared/token" = {};
  systemd.services.cloudflared = {
	after = [
      "network.target"
      "network-online.target"
    ];
	wants = [
      "network.target"
      "network-online.target"
    ];
	wantedBy = [ "multi-user.target" ];
	serviceConfig = {
	  ExecStart = ''${pkgs.bash}/bin/bash -c '${pkgs.cloudflared}/bin/cloudflared tunnel --no-autoupdate run --token "$(cat ${config.sops.secrets."cloudflared/token".path})"' '';
	  Restart = "on-failure";
	};
  };

  boot.extraModprobeConfig = ''
    options amdgpu virtual_display=1
# create dummy display to be able to start x11
  ''; 

  boot.supportedFilesystems = [ "zfs" ];

  environment.systemPackages = with pkgs; [
    zfs
    screen #can be user (and global)
  ];

  networking = {
    hostName = "server";

    interfaces.eth0.ipv4.addresses = [ {
      address = "192.168.1.24";
      prefixLength = 24;
      }
    ];
    defaultGateway.address = "192.168.1.254";
    defaultGateway.interface = "eth0";
    nameservers = ["8.8.8.8" "8.8.4.4" "1.1.1.1"];
      hostId = "68290da7";

    firewall.allowedTCPPorts = ports;
    firewall.allowedUDPPorts = ports;
    firewall.allowedUDPPortRanges = portRanges;
    firewall.allowedTCPPortRanges = portRanges;
  };

  services.fail2ban.enable = true;
  services.fail2ban.bantime = "5h";

  mods.nvidia.enable = true;
  mods.nvidia.beta = true;
  mods.nvidia.containerToolkit = true;

  mods.docker = {
    enable = true;
    boot = true;
  };
}
