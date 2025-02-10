# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    bspwm.nix                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/02/10 00:21:11 by tomoron           #+#    #+#              #
#    Updated: 2025/02/10 00:30:13 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
{lib, config, ... }:

{
  config = lib.mkIf config.mods.x11.enable {
    xsession.windowManager.bspwm.enable = true;
	xsession.windowManager.bspwm.extraConfig = ''
	  #/bin/sh
      pgrep sxhkd > /dev/null || sxhkd &
      pgrep polybar >/dev/null || polybar -q main -c "$HOME/.config/polybar/config.ini"&
      
      bspc config border_width         2
      bspc config window_gap          10
      
      bspc config split_ratio          0.52
      bspc config borderless_monocle   true
      bspc config gapless_monocle      true
      
      pgrep alacritty > /dev/null || alacritty &
      pgrep picom > /dev/null || picom &
      pgrep dunst >/dev/null || dunst &
      numlockx on &
      setxkbmap fr us&
      nitrogen --restore &
      pgrep activate-linux >/dev/null  || (sleep 2;activate-linux -d)&
	''; # this is messy but i don't care, x11 isn't my default now.
    
  };
}
