{ pkgs, config, lib, ... }:
{
	options.mods.zfs.enable = lib.mkOption {
		type = lib.types.bool;
		default = false;
		description = "does this system support zfs filesystems";
	};

	config = lib.mkIf config.mods.zfs.enable {
  		boot.kernelPackages = pkgs.linuxPackages;
  		boot.supportedFilesystems = [ "zfs" ];
	};
}
