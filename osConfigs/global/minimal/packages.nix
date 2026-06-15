# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    packages.nix                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/06/14 18:03:28 by tomoron           #+#    #+#              #
#    Updated: 2026/06/15 12:36:24 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    pciutils

	gnumake
    home-manager
  ];
}
