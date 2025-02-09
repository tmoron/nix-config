{ config, lib, inputs, pkgs, ... }:

{
  options.mods.yubikey = {
    enable = lib.mkOption {
      type = lib.types.bool;
	  default = true;
	  description = "enable yubikey";
	};

	id = lib.mkOption {
		type = lib.str;
		description = "yubikey id";
	};
  };

   config = lib.mkIf config.mods.yubikey.enable {
    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    security.pam.yubico = {
      enable = true;
      id =  config.mods.yubikey.id;
      mode = "challenge-response";
    };
  };
}
