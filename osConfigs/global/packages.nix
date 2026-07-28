# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    packages.nix                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/09/06 00:57:21 by tomoron           #+#    #+#              #
#    Updated: 2026/07/23 15:21:06 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cryptsetup
    usbutils
    ntfs3g
    acpi
    apfs-fuse

	unison

#	nss //is this supposed to be here ?
  ];
}
