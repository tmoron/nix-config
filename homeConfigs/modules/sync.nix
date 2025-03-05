{ lib, config, ... }:

{
  options.mods.sync = {
	enable = lib.mkOption {
      type = lib.types.bool;
	  default = true;
	  description = "enable usr_sync command";
	};

	homeFolder = lib.mkOption {
		type = lib.types.str;
		default = "/home/tom/";
		description = "folder that will be synced with the server";
	};

	destFolder = lib.mkOption {
		type = lib.types.str;
		default = "/raid/pc_sync";
		description = "where on the server";
	};
  };

  config.home.file.".local/bin/usr_sync" =  lib.mkIf config.mods.sync.enable {
  	text = ''
	#!/bin/env
	unison "${config.mods.sync.homeFolder}" "ssh://tom@tmoron.fr:1880/${config.mods.sync.destFolder}" $@
  	'';
	executable = true;
  };
}
