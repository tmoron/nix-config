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
    { _args = [
      (lib.generators.mkLuaInline "mod .. \" + mouse:276\"")
      (lib.generators.mkLuaInline "hl.dsp.window.fullscreen({mode = \"maximized\", action = \"toggle\"})")
      ];}
    { _args = [
      (lib.generators.mkLuaInline "mod .. \" + SHIFT + mouse:276\"")
      (lib.generators.mkLuaInline "hl.dsp.window.fullscreen({mode = \"fullscreen\", action = \"toggle\"})")
      ];}
  ];
}
