# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    laptop.nix                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/09/06 00:56:57 by tomoron           #+#    #+#              #
#    Updated: 2025/10/29 21:15:44 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ lib, config, pkgs, ... }:

{
  boot.initrd.luks.yubikeySupport = true;
  services.udev.packages = [ pkgs.yubikey-personalization ];
  boot.initrd.kernelModules = [ "vfat" "nls_cp437" "nls_iso8859-1" "usbhid" ];
  boot.initrd.luks.devices.cryptroot = {
      device = "/dev/disk/by-uuid/a4593b01-069d-4a5d-a550-74a762b89b3f";
      allowDiscards = true;
    #set up initial : https://wiki.nixos.org/wiki/Yubikey_based_Full_Disk_Encryption_(FDE)_on_NixOS
    yubikey = {
        twoFactor = false;
        keyLength = 64;
        saltLength = 32;
        storage = {
            device = "/dev/disk/by-uuid/BA5C-F216";
            path = "/default";
        };
    };
  };

  boot.blacklistedKernelModules = [ "nvidia" "nvidia_drm" "nvidia_uvm" ]; #speeds up startup
  programs.droidcam.enable = true;

  mods.displayManager.enable = true;
  mods.virtualHost.enable = true;
  mods.yubikey.pam.enable = true;
  networking.firewall.enable = false;

  networking.hostName = "patate-douce";
  networking.wireless.enable = true;
  networking.networkmanager.enable = false;

  specialisation.vfio_ready.configuration = {
    boot.kernel.sysctl."vm.nr_hugepages" = 5120;
    boot.extraModulePackages = with config.boot.kernelPackages; [ kvmfr ];
    boot.kernelModules = [ "kvmfr" ];
    boot.extraModprobeConfig = ''
        options kvmfr static_size_mb=128
        blacklist xpad
    '';
    virtualisation.libvirtd.qemu.verbatimConfig = ''
        cgroup_device_acl = [
            "/dev/kvmfr0", "/dev/null", "/dev/full", "/dev/zero",
            "/dev/random", "/dev/urandom",
            "/dev/ptmx", "/dev/kvm",
            "/dev/rtc","/dev/hpet",
            "/dev/input/by-id/[some_mouse_device]-event-mouse",
            "/dev/input/by-id/[some_keyboard_device]-event-kbd"
        ]
    '';
    services.udev.extraRules = ''
        SUBSYSTEM=="kvmfr", OWNER="tom", GROUP="kvm", MODE="0660"
    '';
    environment.systemPackages = with pkgs; [ looking-glass-client ];
    services.supergfxd.settings.mode = "Vfio";
  };

  networking.dhcpcd.enable = false;
  systemd.network.enable = true;
  networking.useNetworkd = true;

  hardware.bluetooth.enable = true;

  environment.systemPackages = with pkgs; [
    acpi # can be user (global)
  ];


  mods.touchpad.enable = true;

#  programs.gamescope.capSysNice = true;

  mods.powerSave = {
    enable = true;
    powahCommandAdditions = [
      "supergfxctl -m Hybrid"
      "if asusctl profile -p | grep Balanced ; then asusctl profile -P Performance; fi"
      "if asusctl profile -p | grep Quiet ; then asusctl profile -P Balanced; fi"
    ];
    tagueuleCommandAdditions = [
      "echo \"can't safely turn off the GPU\""
      "asusctl profile -P Quiet"
    ];
	cpuMaxFreq = 4465261;

  };


  services.asusd = {
    enable = true;
    enableUserService = true;
  };

  services.supergfxd.enable = true;
  services.supergfxd.settings = {
    mode = lib.mkDefault "Integrated";
    vfio_enable = true;
    vfio_save = true;
    always_reboot = false;
    no_logind = true;
    logout_timeout_s = 180;
    hotplug_type = "None";
  };

  programs.wireshark.enable = true;
  programs.wireshark.usbmon.enable = true;

  mods.docker.enable = true;
  mods.gayming.enable = true;
  mods.nvidia.enable = true;
  mods.nvidia.prime = true;


  services.usbmuxd.enable = true; #hangs when shutting down

#  boot.plymouth = {
#    enable = true;
#    theme = "ycontre-glow";
#    themePackages = [
#        inputs.plymouth-theme-ycontre-glow.defaultPackage.x86_64-linux
#    ];
#  };

  services.flatpak.enable = true;
}
