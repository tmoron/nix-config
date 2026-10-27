# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    server.nix                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/09/06 00:57:09 by tomoron           #+#    #+#              #
#    Updated: 2026/10/27 20:31:56 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ lib, ... }:

{
  imports = (lib.fileset.toList ./services);


  mods.nvidia.enable = true;
  mods.nvidia.beta = true;
  mods.nvidia.containerToolkit = true;

  mods.docker = {
    enable = true;
    boot = true;
  };
}
