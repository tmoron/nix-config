# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    iso.nix                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/09/06 00:57:02 by tomoron           #+#    #+#              #
#    Updated: 2025/09/06 00:57:03 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{lib, ... }:

{
  imports = [
    ../global/packages.nix 
  ];

  users.users.tom = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" ];
    initialHashedPassword = "";
  }; 
  
  services.getty.autologinUser = lib.mkForce "tom";
  services.getty.helpLine = lib.mkForce "";
}
