{pkgs, config, ... }:

{
  specialisation.vfio_ready.configuration = {
	#vfio ready configuration sets up kvmfr0 kernel module, disables xbox controller on host os, enables libvirtd and installs looking-glass

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
}
