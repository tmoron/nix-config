{ lib, ... }:
{
  wayland.windowManager.hyprland.settings.bind = [
    # Move focus
    { _args = [
      (lib.generators.mkLuaInline "mod .. \" + H\"")
      (lib.generators.mkLuaInline "hl.dsp.focus({direction = \"l\"})")
      ];}
    { _args = [
      (lib.generators.mkLuaInline "mod .. \" + L\"")
      (lib.generators.mkLuaInline "hl.dsp.focus({direction = \"r\"})")
      ];}
    { _args = [
      (lib.generators.mkLuaInline "mod .. \" + K\"")
      (lib.generators.mkLuaInline "hl.dsp.focus({direction = \"u\"})")
      ];}
    { _args = [
      (lib.generators.mkLuaInline "mod .. \" + J\"")
      (lib.generators.mkLuaInline "hl.dsp.focus({direction = \"d\"})")
      ];}

    #swap windows
    { _args = [
      (lib.generators.mkLuaInline "mod .. \" + SHIFT + H\"")
      (lib.generators.mkLuaInline "hl.dsp.window.swap({direction = \"l\"})")
      ];}
    { _args = [
      (lib.generators.mkLuaInline "mod .. \" + SHIFT + L\"")
      (lib.generators.mkLuaInline "hl.dsp.window.swap({direction = \"r\"})")
      ];}
    { _args = [
      (lib.generators.mkLuaInline "mod .. \" + SHIFT + K\"")
      (lib.generators.mkLuaInline "hl.dsp.window.swap({direction = \"u\"})")
      ];}
    { _args = [
      (lib.generators.mkLuaInline "mod .. \" + SHIFT + J\"")
      (lib.generators.mkLuaInline "hl.dsp.window.swap({direction = \"d\"})")
      ];}

  ];
}
