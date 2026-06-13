# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    remote_build.nix                                   :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/09/05 23:47:09 by tomoron           #+#    #+#              #
#    Updated: 2026/06/13 23:44:37 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{config, lib, ... }:

{
  options.mods.remote-build.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "setup remote nix builder";
  };

  config = lib.mkIf config.mods.remote-build.enable {
    nix.buildMachines = [
      {
        hostName = "tmoron.fr";
        sshUser = "builder";
        protocol = "ssh-ng";

        sshKey = "/root/.ssh/id_ed25519";

        system = "x86_64-linux";

        maxJobs = 2;
        speedFactor = 2;

        supportedFeatures = ["big-parallel" "kvm" "nixos-test"];
      }
    ];
    nix.distributedBuilds = true;
    programs.ssh.extraConfig = ''
        Host tmoron.fr
          HostName tmoron.fr
        Port 1880 
    '';
  };
}
