# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    os.nix                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/09/06 00:56:36 by tomoron           #+#    #+#              #
#    Updated: 2026/05/31 15:39:42 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ lib, flakeName, ... }:

{
  imports = lib.concatLists [
    [ ./hardware-configuration.nix ]
    (lib.fileset.toList ./global)
    (lib.fileset.toList ./modules)
  ];

  system.stateVersion = "25.05";
  environment.etc.nixosFlakeName.text = "${flakeName}";

  catppuccin.autoEnable = false;
}
