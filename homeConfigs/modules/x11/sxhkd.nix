# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    sxhkd.nix                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/02/10 00:32:47 by tomoron           #+#    #+#              #
#    Updated: 2025/02/10 01:17:29 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{ lib, config, ... }:

{
  config = lib.mkIf config.mods.x11.enable {
    services.sxhkd.enable = true;
    services.sxhkd.keybindings = {
      "super + Return" = "alacritty";
      "super + d" = "dmenu_run";
      "super + shift + d" = "dmenu_run";
      "super + Escape" = "pkill -USR1 -x sxhkd";

      "super + alt + {q,r}" = "bspc {quit,wm -r}";
      "control + alt + {_,shift + }q" = "bspc node -{c,k}";

      "super + m" = "bspc desktop -l next";
      "super + y" = "bspc node newest.marked.local -n newest.!automatic.local";

      "super + g" = "bspc node -s biggest.window";

      "super + {t,shift + t,s,f}" = "bspc node -t {tiled,pseudo_tiled,floating,fullscreen}";
      "super + ctrl + {m,x,y,z}" = "bspc node -g {marked,locked,sticky,private}";

      "super + {_,shift + }{h,j,k,l}" = "bspc node -{f,s} {west,south,north,east}";
      "super + {p,b,comma,period}" = "bspc node -f @{parent,brother,first,second}";
      "super + {_,shift + }c" = "bspc node -f {next,prev}.local.!hidden.window";

      "super + bracket{left,right}" = "bspc desktop -f {prev,next}.local";
      "super + {grave,Tab}" = "bspc {node,desktop} -f last";

      "super + {_,shift + }{1-9,0}" = "bspc {desktop -f,node -d} '^{1-9,10}'";

      #
      # preselect
      #
      "super + ctrl + {h,j,k,l}" = "bspc node -p {west,south,north,east}";
      "super + ctrl + {1-9}" = "bspc node -o 0.{1-9}";
      "super + ctrl + space" = "bspc node -p cancel";
      "super + ctrl + shift + space" = "bspc query -N -d | xargs -I id -n 1 bspc node id -p cancel";

      #
      # move/resize
      #

      "super + alt + {h,j,k,l}" = "bspc node -z {left -20 0,bottom 0 20,top 0 -20,right 20 0}";
      "super + alt + shift + {h,j,k,l}" = "bspc node -z {right -20 0,top 0 20,bottom 0 -20,left 20 0}";
      "super + {Left,Down,Up,Right}" = "bspc node -v {-20 0,0 20,0 -20,20 0}";

      "XF86AudioLowerVolume" = "pactl set-sink-volume @DEFAULT_SINK@ -5%";

      "XF86AudioRaiseVolume" = "pactl set-sink-volume @DEFAULT_SINK@ +5%";
      "XF86AudioMute" = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
      "XF86MonBrightnessUp" = "brightness up";
      "XF86MonBrightnessDown" = "brightness down";

      "alt + F7" = "brightnessctl s 10-";
      "alt + F8" = "brightnessctl s 10+";

      "super + shift + o" = "playerctl play-pause";
      "super + shift + p" = "playerctl previous";
      "super + shift + n" = "playerctl next";
      "super + shift + alt + b" = "polybar-msg cmd hide";
      "super + shift + b" = "polybar-msg cmd show";
    };
  };
}
