# Edit this configuration file to define what should be installed on your system. Help is available in the configuration.nix(5) man page, on 
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, inputs, pkgs, ... }:

{ 
  # imports = [];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    timeout = 1;
  };

  networking.networkmanager.enable = lib.mkDefault true;

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  services.xserver.enable = true;
  services.xserver.displayManager.startx.enable = true;

  # Enable sound.
  # hardware.pulseaudio.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager). services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tom = {
     isNormalUser = true;
     extraGroups = [ "wheel" ];
     initialPassword = "password";
#     packages = with pkgs; [];
   };

  # List packages installed in system profile. To search,: $ nix search wget
  environment.systemPackages = with pkgs; [
	home-manager
	killall
   	vim
  ];

  #Open ports in the firewall.
  #  networking.firewall.allowedTCPPorts = [ ... ];
  #  networking.firewall.allowedUDPPorts = [ ... ];
  #Or disable the firewall altogether.
  #  networking.firewall.enable = false;

  system.stateVersion = "24.05"; # Did you read the comment?

}
