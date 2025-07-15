{ config, pkgs, ... }:

{
  boot.initrd.luks.devices.cryptroot.device = "/dev/disk/by-uuid/a4593b01-069d-4a5d-a550-74a762b89b3f";
  boot.initrd.luks.devices.cryptroot.allowDiscards = true;

  mods.displayManager.enable = true;
  mods.virtualManager.enable = false;
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
  };

  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;
  virtualisation.libvirtd.qemu.runAsRoot = true;
  virtualisation.libvirtd.qemu.vhostUserPackages = [ pkgs.virtiofsd ];

  networking.dhcpcd.enable = false;
  systemd.network.enable = true;
  networking.useNetworkd = true;

  environment.systemPackages = with pkgs; [
    acpi
	tlp
	fprintd
  ];

  hardware.nvidia.prime.offload = {
    enable = true;
	enableOffloadCmd = true;
  };

  services.libinput.enable = true;
  services.libinput.touchpad.clickMethod = "clickfinger";
  services.libinput.touchpad.tapping = false;

  hardware.bluetooth.enable = true;

  #power management
  powerManagement.enable = true;
  powerManagement.cpuFreqGovernor = "powersave";
  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = {
    battery = {
      governor = "powersave";
      turbo = "never";
    };
    charger = {
      governor = "performance";
      turbo = "auto";
    };
  };
  services.upower.enable = true;

  services.udev.packages = [ pkgs.yubikey-personalization ];

  programs.wireshark.enable = true;
  programs.wireshark.usbmon.enable = true;

#  boot.plymouth = {
#    enable = true;
#	theme = "ycontre-glow";
#	themePackages = [
#		inputs.plymouth-theme-ycontre-glow.defaultPackage.x86_64-linux
#	];
#  };
}
