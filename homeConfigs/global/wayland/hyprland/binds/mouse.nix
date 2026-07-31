{ lib, ... }:
{
  wayland.windowManager.hyprland.settings.bind = [
      #mouse binds
      { _args = [
        (lib.generators.mkLuaInline "mod .. \" + mouse:272\"")
        (lib.generators.mkLuaInline "hl.dsp.window.drag()")
        {mouse = true;}
        ];}
      { _args = [
        (lib.generators.mkLuaInline "mod .. \" + mouse:273\"")
        (lib.generators.mkLuaInline "hl.dsp.window.resize()")
        {mouse = true;}
        ];}
  ];
}
