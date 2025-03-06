{ inputs,  pkgs, ... }:

{
  boot.kernelParams = [ "kvm.enable_virt_at_load=0" ];

  boot.initrd.luks.devices.cryptroot.device = "/dev/disk/by-uuid/fd3eb360-0bf9-4622-acf1-e461304b59fe";

  networking.hostName = "patate-douce";
  networking.wireless.enable = true;
  networking.networkmanager.enable = false;

  environment.systemPackages = with pkgs; [
    acpi
	tlp
	looking-glass-client
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

#  boot.plymouth = {
#    enable = true;
#	theme = "ycontre-glow";
#	themePackages = [
#		inputs.plymouth-theme-ycontre-glow.defaultPackage.x86_64-linux
#	];
#  };
}
