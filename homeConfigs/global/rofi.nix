# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    rofi.nix                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/10/31 17:40:24 by tomoron           #+#    #+#              #
#    Updated: 2026/10/31 23:16:46 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ pkgs, ... }:
let
  updatedRofi = pkgs.rofi-unwrapped.overrideAttrs (oldAttrs: {
    src = pkgs.fetchFromGitHub {
      owner = "davatorium";
      repo = "rofi";
      fetchSubmodules = true;
      rev = "8cf8134ec66febdcbb37ebd4bcd95ee7cc001238";
      hash = "sha256-bilI49AZCegemypZ22mBVVWntSouLytla250mAqeJSg=";
    };
  });
in
{
  programs.rofi = {
    enable = true;
    theme = "rounded-nord-dark";

    package = updatedRofi;
  };

  home.packages = [
    ( pkgs.writeShellApplication {
      name = "rofi-wrapper";

      text = ''
        rofi -modes "drun,quick:${../assets/rofi-modules/quick-switch.sh},firefox:${../assets/rofi-modules/firefox.sh}" -show-icons -show quick -auto-select
      '';
    })
  ];

  home.file.".local/share/rofi/themes".source = "${fetchGit {
  	url = "https://github.com/newmanls/rofi-themes-collection";
  	rev = "c8239a45edced3502894e1716a8b661fdea8f1c9";
  	ref = "master";
  }}/themes";
}
