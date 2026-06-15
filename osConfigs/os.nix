# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    os.nix                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/09/06 00:56:36 by tomoron           #+#    #+#              #
#    Updated: 2026/06/14 18:56:12 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ lib, flakeName, minimal, ... }:

{
  imports = (lib.concatLists [
    [ ./hardware-configuration.nix ]
    (lib.fileset.toList ./modules)
  ])
  ++ (lib.lists.optionals minimal (lib.fileset.toList ./global/minimal))
  ++ (lib.lists.optionals (!minimal) (lib.fileset.toList ./global));


  system.stateVersion ="25.05";
  environment.etc.nixosFlakeName.text = "${flakeName}";

}
