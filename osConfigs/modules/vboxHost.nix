{ config, lib, inputs, pkgs, ... }:

{
  options.mods.virtualManager.enable = lib.mkOption {
    type = lib.types.bool;
	default = true;
	description = "enable virtual manager as host";
  };

  config = lib.mkIf config.mods.virtualManager.enable {
  	programs.virt-manager.enable = true;
  	virtualisation.libvirtd.enable = true;
  	virtualisation.libvirtd.qemu.runAsRoot = true;
  	virtualisation.libvirtd.qemu.vhostUserPackages = [ pkgs.virtiofsd ];
	virtualisation.spiceUSBRedirection.enable = true;

	environment.systemPackages = with pkgs; [ spice-gtk ];
  };
}
