# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    user.nix                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/09/05 23:42:18 by tomoron           #+#    #+#              #
#    Updated: 2026/01/13 16:32:42 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ ... }:

{
  users.users.tom = {
     isNormalUser = true;
     extraGroups = [
     "wheel" # can sudo
     "docker" # can use docker
     "libvirtd" # can use libvirtd
     "dialout" # can use serial devices
     "wireshark" # can use wireshask
     ];

     initialPassword = "password";
   };
}
