
{ config, lib, inputs, pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
	enable32Bit = true;
  };

  services.xserver.videoDrivers = ["nvidia"];
}
