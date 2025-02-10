{ lib, config, ... }:

{
  options.mods.alacritty.enable = lib.mkOption {
    type = lib.types.bool;
	default = true;
	description = "install and config alacritty";
  };

  config = lib.mkIf config.mods.alacritty.enable {
    programs.alacritty = {
      enable = true;
      settings = {
        window.opacity = 0.9;
        env.XTERM = "xterm-256color";
        font.size = 10;
      };
    };
  };
}
