# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    networking.nix                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/10/27 20:13:33 by tomoron           #+#    #+#              #
#    Updated: 2026/10/27 20:13:34 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ ... }:
let
  ports = [
    22 #git ssh
    80 443 #http server
    5000 #frigate
    8083 137 138 139 445 548 3702 5357 #prob some samba shit
    24454 #minecraft voice chat
    25565 # minecraft server
	9091 # transmission web interface
  ];
  portRanges = [
    {from = 47950; to = 49000;} #moonlight (wolf)
  ];
in
{
  networking = {
    hostName = "server";

    interfaces.eth0.ipv4.addresses = [ {
      address = "192.168.1.24";
      prefixLength = 24;
    } ];
    defaultGateway.address = "192.168.1.254";
    defaultGateway.interface = "eth0";
    nameservers = ["8.8.8.8" "8.8.4.4" "1.1.1.1"];
    hostId = "68290da7";

    firewall.allowedTCPPorts = ports;
    firewall.allowedUDPPorts = ports;
    firewall.allowedUDPPortRanges = portRanges;
    firewall.allowedTCPPortRanges = portRanges;
  };
}
