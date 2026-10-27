# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    pipewire.nix                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/10/27 21:12:15 by tomoron           #+#    #+#              #
#    Updated: 2026/10/27 21:12:27 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ ... }:
{
  services.pipewire = {
    raopOpenFirewall = true;
  
    extraConfig.pipewire = {
      "10-airplay"."context.modules" = [
        { name = "libpipewire-module-raop-discover"; }
      ];
    };
  };

  services.pipewire.wireplumber.extraConfig."10-bluez" = {
    "monitor.bluez.properties" = {
      "bluez5.enable-sbc-xq" = true;
      "bluez5.enable-msbc" = true;
      "bluez5.enable-hw-volume" = true;
    };
  };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.settings = {
    General = {
      Enable = "Source,Sink,Media,Socket";
    };
  };
}
