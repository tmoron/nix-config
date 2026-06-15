# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    user.nix                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/09/05 23:42:18 by tomoron           #+#    #+#              #
#    Updated: 2026/06/14 18:07:45 by tomoron          ###   ########.fr        #
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

     initialPassword = "password";
   };
}
