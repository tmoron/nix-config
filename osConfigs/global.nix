# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    global.nix                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/02/09 01:43:46 by tomoron           #+#    #+#              #
#    Updated: 2025/02/09 18:28:27 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ lib, pkgs, flakeName, ... }:

{ 
  imports = lib.concatLists [[
  	  ./hardware-configuration.nix
	  ./packages.nix
    ]
    (lib.fileset.toList ./modules)
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;

  boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;

  boot.loader = {
    systemd-boot.enable = true;
	systemd-boot.memtest86.enable = true;
    efi.canTouchEfiVariables = true;
    timeout = 1;
  };

  networking.networkmanager.enable = lib.mkDefault true;

  time.timeZone = "Europe/Paris";

  services.xserver.enable = lib.mkDefault true;
  services.xserver.displayManager.startx.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  users.users.tom = {
     isNormalUser = true;
     extraGroups = [ "wheel" "docker" "libvirtd"];
     initialPassword = "password";
   };

  virtualisation.docker.enable = true;
  virtualisation.docker.enableOnBoot = lib.mkDefault false;

  programs.hyprland.enable = lib.mkDefault true;

  system.stateVersion = "24.05";
  environment.etc.nixosFlakeName.text = "${flakeName}";
}
