# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    user.nix                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/09/05 23:42:18 by tomoron           #+#    #+#              #
#    Updated: 2026/07/07 17:49:04 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ ... }:

{
  users.users.tom = {
     extraGroups = [
     "libvirtd" # can use libvirtd
     "dialout" # can use serial devices
     "wireshark" # can use wireshask
	 "plugdev" #some esp things
     ];
   };
   users.groups.plugdev = {};
}
