# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    user.nix                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/09/05 23:42:18 by tomoron           #+#    #+#              #
#    Updated: 2026/08/16 00:33:56 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ ... }:

{
  users.users.tom = {
     isNormalUser = true;
     extraGroups = [
     "wheel" # can sudo
     "docker" # can use docker
     ];

     uid = 1000;
     initialPassword = "password";
   };
}
