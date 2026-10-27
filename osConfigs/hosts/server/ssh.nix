# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ssh.nix                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/10/27 20:15:34 by tomoron           #+#    #+#              #
#    Updated: 2026/10/27 20:15:35 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ ... }:
{
  services.openssh.enable = true;
  services.openssh.settings.PasswordAuthentication = false;
  services.openssh.ports = [ 1880 ];

  services.fail2ban.enable = true;
  services.fail2ban.bantime = "5h";
}
