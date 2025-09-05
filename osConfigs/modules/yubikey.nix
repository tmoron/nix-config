# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    yubikey.nix                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/09/05 23:47:20 by tomoron           #+#    #+#              #
#    Updated: 2025/09/06 01:03:54 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ config, lib, pkgs, ... }:

{
  options.mods.yubikey.pam = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "enable yubikey pam module\nuse `ykpamcfg` to configure";
    };

    id = lib.mkOption {
        type = lib.str;
        description = "id of the yubikey written under connector";
    };
  };

  config = lib.mkIf config.mods.yubikey.pam.enable {
    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    security.pam.yubico = {
      enable = true;
      id =  config.mods.yubikey.pam.id;
      mode = "challenge-response";
    };

    environment.systemPackages = with pkgs; [
      yubico-pam
    ];
  };
}
