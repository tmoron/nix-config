# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    configuration.nix                                  :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/02/09 01:43:46 by tomoron           #+#    #+#              #
#    Updated: 2025/02/09 01:50:15 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ config, lib, inputs, pkgs, flakeName, ... }:

{ 
  imports = [
  	./hardware-configuration.nix
	./modules/yubikey.nix
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

  services.xserver.enable = true;
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

  environment.systemPackages = with pkgs; [
	home-manager
	killall
   	vim
	pciutils
	pigz
	htop
	gnumake
	git
	neofetch
	ntfs3g
	clang
	ninja
	gdb
	valgrind
	wget
	cmake
	usbutils
	man-pages
	stress
	ffmpeg
  ];

  system.stateVersion = "24.05";

  environment.etc.nixosFlakeName.text = "${flakeName}";

  programs.hyprland.enable = true;
}
