# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    home.nix                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/17 18:15:38 by tomoron           #+#    #+#              #
#    Updated: 2026/06/15 01:53:27 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{
lib,
username ? "tom",
homeDir ? "/home/tom",
isOs ? false,
configSops ? true,
minimal,
... 
}:

{
  imports = (lib.fileset.toList ./modules)
  ++ (lib.lists.optionals minimal (lib.fileset.toList ./global/minimal))
  ++ (lib.lists.optionals (!minimal) (lib.fileset.toList ./global));

  home.username = lib.mkIf (!isOs) "${username}";
  home.homeDirectory = lib.mkIf (!isOs) "${homeDir}";

  home.stateVersion = "25.11";

  sops = lib.mkIf configSops{
    defaultSopsFile = ../secrets/secrets.yaml;
    age.keyFile = "${homeDir}/.config/sops/age/keys.txt";
  };

  services.dunst.enable = true;
  programs.home-manager.enable = true;
}
