{config, lib, ... }:

{
  options.mods.gayming.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "enable games on the host";
  };

  config = lib.mkIf config.mods.gayming.enable {
    programs.steam.enable = true; 
    programs.steam.protontricks.enable = true;
  };
}
