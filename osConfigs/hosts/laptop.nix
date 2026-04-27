# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    laptop.nix                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/09/06 00:56:57 by tomoron           #+#    #+#              #
#    Updated: 2026/04/27 12:53:46 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ lib, config, pkgs, ... }:

{
  services.udev.packages = [ pkgs.yubikey-personalization ];
  boot.initrd.kernelModules = [ "vfat" "nls_cp437" "nls_iso8859-1" "usbhid" ];
  boot.initrd.systemd.enable = false;
  boot.initrd.luks.yubikeySupport = true;
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
  mods.yubikey.pam.enable = true;
  networking.firewall.enable = false;

  networking.hostName = "patate-douce";
#  networking.wireless.enable = true;
  networking.networkmanager.wifi.backend = "iwd";
  networking.wireless.iwd.enable = true;
  networking.wireless.allowAuxiliaryImperativeNetworks = true;
  networking.networkmanager.enable = false;

  specialisation.vfio_ready.configuration = {

    mods.virtualHost.enable = true;
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
        ]
    '';
    services.udev.extraRules = ''
        SUBSYSTEM=="kvmfr", OWNER="tom", GROUP="kvm", MODE="0660"
    '';
    environment.systemPackages = with pkgs; [ looking-glass-client ];
  };

  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTRS{idVendor}=="2e3c", ATTRS{idProduct}=="df11", TAG+="uaccess"
    SUBSYSTEM=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="df11", TAG+="uaccess"
  '';
   

  networking.dhcpcd.enable = false;
  systemd.network.enable = true;
  networking.useNetworkd = true;

  programs.noisetorch.enable = true;

  services.postgresql.enable = true;

  hardware.bluetooth.enable = true;

  environment.systemPackages = with pkgs; [
    acpi # can be user (global)
	openvr
  ];

#  programs.alvr.enable = true;
  

  mods.touchpad.enable = true;

  mods.powerSave = {
    enable = true;
    powahCommandAdditions = [
      "supergfxctl -m Hybrid"
      "if [ $# -gt 0 ] && [[ \"$1\" == \"moar\" ]] ; then asusctl profile set Performance; fi"
    ];
    tagueuleCommandAdditions = [
      "echo \"can't safely turn off the GPU\""
      "asusctl profile set Quiet"
    ];
	cpuMaxFreq = 4465261;

  };


  services.asusd = {
    enable = true;
#    enableUserService = true;
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


  services.usbmuxd.enable = true; #sometimes hangs when shutting down


  services.avahi.enable = true;
  services.pipewire = {
    raopOpenFirewall = true;
  
    extraConfig.pipewire = {
      "10-airplay"."context.modules" = [
        { name = "libpipewire-module-raop-discover"; }
      ];
    };
  };

  services.pipewire.wireplumber.extraConfig."10-bluez" = {
    "monitor.bluez.properties" = {
      "bluez5.enable-sbc-xq" = true;
      "bluez5.enable-msbc" = true;
      "bluez5.enable-hw-volume" = true;
    };
  };
  hardware.bluetooth.settings = {
    General = {
      Enable = "Source,Sink,Media,Socket";
    };
  };

}
