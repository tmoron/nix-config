# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    packages.nix                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/09/06 00:57:21 by tomoron           #+#    #+#              #
#    Updated: 2026/06/15 12:36:24 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cryptsetup
    usbutils
    ntfs3g
    acpi

	unison

#	nss //is this supposed to be here ?
  ];
}
