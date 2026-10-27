# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    asus.nix                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/10/27 22:11:44 by tomoron           #+#    #+#              #
#    Updated: 2026/10/27 22:12:03 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{lib, ... }:
{
  services.asusd = {
    enable = true;
  };
  services.supergfxd.enable = true;
  services.supergfxd.settings = {
    mode = lib.mkDefault "Integrated";
    vfio_enable = true;
    vfio_save = true;
    always_reboot = false;
    no_logind = true;
    logout_timeout_s = 180;
    hotplug_type = "None";
  };
}
