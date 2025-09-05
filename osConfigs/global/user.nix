# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    user.nix                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/09/05 23:42:18 by tomoron           #+#    #+#              #
#    Updated: 2025/09/06 00:57:32 by tomoron          ###   ########.fr        #
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
