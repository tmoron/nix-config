{ config, lib, pkgs, username,homeDir, ... }:

{
  home.packages = with pkgs;[	
	dmenu
	brightnessctl
    rofi
  ];

  mods.game.enable = false;
  mods.hyprland.enable = false;
  mods.x11.enable = true;
  programs.firefox.enable = false;

  mods.sync.homeFolder = "/sgoinfre/goinfre/Perso/tomoron";

  programs.bash.profileExtra = 
  ''
    export PATH="$HOME/.local/bin:$HOME/.nix-profile/bin:$PATH"
    export C_INCLUDE_PATH="$HOME/.local/include"
    export CPLUS_INCLUDE_PATH="$HOME/.local/include"
    export LIBRARY_PATH="$HOME/.local/lib"
    export LD_LIBRARY_PATH=$HOME/.local/lib
    
    #ft_cockd&
    #bash -c "while :; do sleep 30; killall ft_lock; done"&
    /usr/bin/xterm +cm -cr RED -maximized -bg BLACK -selbg WHITE -selfg BLACK -fg WHITE -fa Monospace -fs 14
    
    msg_daemon&
    blink&
    BLINK_PID=$!
    ft_lock -d&
    #sync_desktop -batch >/dev/null 2> /dev/null&
    /usr/bin/xterm +cm -cr RED -maximized -bg BLACK -selbg WHITE -selfg BLACK -fg WHITE -fa Monospace -fs 14 -e "bash -c \"dwm&alacritty&update_home;killall dwm\""
    (sleep 10 ;setxkbmap fr us)&
    bspwm
    kill $BLINK_PID
    exit
  '';
}
