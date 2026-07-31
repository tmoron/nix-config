{ lib, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings.binds = [
    { _args = [
        (lib.generators.mkLuaInline "mod .. \" + Return\"")
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"alacritty\")")
      ]; }
    { _args = [
      "CTRL + ALT + Q"
      (lib.generators.mkLuaInline "hl.dsp.window.close()")
      ];}

    { _args = [
      "CTRL + ALT + SHIFT + Q"
      (lib.generators.mkLuaInline "hl.dsp.window.kill()")
      ];}

    { _args = [
      (lib.generators.mkLuaInline "mod .. \" + ALT + Q\"")
      (lib.generators.mkLuaInline "hl.dsp.exit()")
      {long_press = true; }
      ];}

    { _args = [
      (lib.generators.mkLuaInline "mod .. \" + S\"")
      (lib.generators.mkLuaInline "hl.dsp.window.float({action = \"toggle\"})")
      ];}

    { _args = [
      (lib.generators.mkLuaInline "mod .. \" + I\"")
      (lib.generators.mkLuaInline "hl.dsp.window.pin({action = \"toggle\"})")
      ];}

    { _args = [
      (lib.generators.mkLuaInline "mod .. \" + D\"")
      (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${lib.getExe pkgs.rofi} -show drun -show-icons\")")
      ];}
    { _args = [
      (lib.generators.mkLuaInline "mod .. \" + SHIFT + D\"")
      (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${lib.getExe pkgs.rofi} -show run -show-icons\")")
      ];}

    { _args = [
      (lib.generators.mkLuaInline "mod .. \" + M\"")
      (lib.generators.mkLuaInline "hl.dsp.window.fullscreen({mode = \"maximized\", action = \"toggle\"})")
      ];}
    { _args = [
      (lib.generators.mkLuaInline "mod .. \" + F\"")
      (lib.generators.mkLuaInline "hl.dsp.window.fullscreen({mode = \"fullscreen\", action = \"toggle\"})")
      ];}
  ];
}
