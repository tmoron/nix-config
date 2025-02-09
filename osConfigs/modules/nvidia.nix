
{ config, lib, inputs, pkgs, ... }:

{
  options.mods.nvidia-graphics.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "enable my nvidia graphics settings";
  };
  
  config = lib.mkIf config.mods.nvidia-graphics.enable {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    services.xserver.videoDrivers = ["nvidia"];
  };

}
