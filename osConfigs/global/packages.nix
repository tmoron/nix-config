# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    packages.nix                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/09/06 00:57:21 by tomoron           #+#    #+#              #
#    Updated: 2025/12/30 18:12:05 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    home-manager
    vim
    pciutils
    usbutils
    ntfs3g
    cryptsetup
    acpi

	nss
  ];
}
