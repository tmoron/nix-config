# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    nix.nix                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/09/05 23:42:17 by tomoron           #+#    #+#              #
#    Updated: 2025/09/05 23:42:20 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ ... }:

{
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;
}
