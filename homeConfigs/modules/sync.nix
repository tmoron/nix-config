{ lib, config, pkgs, ... }:

{
  options.mods.sync.enable = lib.mkOption {
    type = lib.types.bool;
	default = true;
	description = "enable desk_sync command";
  };

  home.file.".local/bin/desk_sync" = pkgs.writeShellScriptBin "desk_sync" ''
  ${pkgs.unison}/
  config = lib.mkIf config.mods.sync.enable {
	'';
  };
}
