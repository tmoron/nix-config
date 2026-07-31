{ lib, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings.bind = [
      { _args = [
        "XF86AudioRaiseVolume"
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+\")")
        {locked = true; repeating = true; }
        ];}

      { _args = [
        "XF86AudioLowerVolume"
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-\")")
        {locked = true; repeating = true; }
        ];}
      { _args = [
        "XF86AudioMute"
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle\")")
        {locked = true; repeating = true; }
        ];}

      { _args = [
        "XF86AudioMicMute"
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle\")")
        {locked = true; repeating = true; }
        ];}


      { _args = [
        "XF86AudioNext"
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${lib.getExe pkgs.playerctl} next\")")
        {locked = true; }
        ];}

      { _args = [
        "XF86AudioPrev"
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${lib.getExe pkgs.playerctl} previous\")")
        {locked = true;}
        ];}

      { _args = [
        "XF86AudioPause"
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${lib.getExe pkgs.playerctl} pause\")")
        {locked = true;}
        ];}

      { _args = [
        "XF86AudioPlay"
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${lib.getExe pkgs.playerctl} play\")")
        {locked = true;}
        ];}

      { _args = [
        (lib.generators.mkLuaInline "mod .. \" + N\"")
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${lib.getExe pkgs.playerctl} next\")")
        {locked = true;}
        ];}

      { _args = [
        (lib.generators.mkLuaInline "mod .. \" + P\"")
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${lib.getExe pkgs.playerctl} previous\")")
        {locked = true;}
        ];}

      { _args = [
        (lib.generators.mkLuaInline "mod .. \" + O\"")
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${lib.getExe pkgs.playerctl} play-pause\")")
        {locked = true;}
        ];}
    ];
}
