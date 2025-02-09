{ config, lib, inputs, pkgs, ... }:

{
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  security.pam.yubico = {
    enable = true;
    id = "30536547";
    mode = "challenge-response";
  };
}
