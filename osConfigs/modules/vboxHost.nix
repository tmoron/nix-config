{ config, lib, inputs, pkgs, ... }:

{
  options.mods.virtualbox.enable = lib.mkOption {
    type = lib.types.bool;
	default = true;
	description = "enable virtualbox as host";
  };

  config = lib.mkIf config.mods.virtualbox.enable {
    virtualisation.virtualbox.host.enable = true;
    users.users.tom.extraGroups = [ "vboxusers" ];
  };
}
