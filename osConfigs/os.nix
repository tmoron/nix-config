# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    os.nix                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/09/06 00:56:36 by tomoron           #+#    #+#              #
#    Updated: 2025/09/06 00:56:37 by tomoron          ###   ########.fr        #
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
}
