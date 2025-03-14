{ lib, config, ... }:

let
  defPathLst = ["desktop" "42_desktop" "downloads"];
in
{
  options.mods.sync = {
	enable = lib.mkOption {
      type = lib.types.bool;
	  default = true;
	  description = "setup unison";
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

	defaultSynced = lib.mkOption {
		type = lib.types.bool;
		default = true;
		description = "should it add the default paths";
	};

	syncedAdditions = lib.mkOption {
		type = lib.types.listOf lib.types.str;
		default = [];
		description = "list of path that will be synced";
	};

	customHostName = lib.mkOption {
		type = lib.types.nullOr lib.types.str;
		default = null;
		description = "hostname used by unison";
	};
  };

  config.home.file.".unison/default.prf" =  lib.mkIf config.mods.sync.enable {
    text = (lib.strings.concatStrings [''
		auto=true
		root=${config.mods.sync.homeFolder}
		root=ssh://tom@tmoron.fr:1880/${config.mods.sync.destFolder}
	  ''
	  (lib.strings.concatMapStrings (x: "\npath=" + x) (( if config.mods.sync.defaultSynced then defPathLst else [] ) ++ config.mods.sync.syncedAdditions ))
      (if !(isNull config.mods.sync.customHostName) then "\nclientHostName=${config.mods.sync.customHostName}" else "")
	  ]);
  };
}
