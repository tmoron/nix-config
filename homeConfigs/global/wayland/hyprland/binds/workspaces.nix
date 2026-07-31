{ lib, ... }:
{
  wayland.windowManager.hyprland.settings.binds = [
    # Switch workspaces with mainMod + [0-9]
    { _args = [
      (lib.generators.mkLuaInline "mod .. \" + 1\"")
      (lib.generators.mkLuaInline "hl.dsp.focus({workspace = \"1\"})")
      ];}
    { _args = [
      (lib.generators.mkLuaInline "mod .. \" + 2\"")
      (lib.generators.mkLuaInline "hl.dsp.focus({workspace = \"2\"})")
      ];}
    { _args = [
      (lib.generators.mkLuaInline "mod .. \" + 3\"")
      (lib.generators.mkLuaInline "hl.dsp.focus({workspace = \"3\"})")
      ];}
    { _args = [
      (lib.generators.mkLuaInline "mod .. \" + 4\"")
      (lib.generators.mkLuaInline "hl.dsp.focus({workspace = \"4\"})")
      ];}
    { _args = [
      (lib.generators.mkLuaInline "mod .. \" + 5\"")
      (lib.generators.mkLuaInline "hl.dsp.focus({workspace = \"5\"})")
      ];}
    { _args = [
      (lib.generators.mkLuaInline "mod .. \" + 6\"")
      (lib.generators.mkLuaInline "hl.dsp.focus({workspace = \"6\"})")
      ];}
    { _args = [
      (lib.generators.mkLuaInline "mod .. \" + 7\"")
      (lib.generators.mkLuaInline "hl.dsp.focus({workspace = \"7\"})")
      ];}
    { _args = [
      (lib.generators.mkLuaInline "mod .. \" + 8\"")
      (lib.generators.mkLuaInline "hl.dsp.focus({workspace = \"8\"})")
      ];}
    { _args = [
      (lib.generators.mkLuaInline "mod .. \" + 9\"")
      (lib.generators.mkLuaInline "hl.dsp.focus({workspace = \"9\"})")
      ];}
    { _args = [
      (lib.generators.mkLuaInline "mod .. \" + 0\"")
      (lib.generators.mkLuaInline "hl.dsp.focus({workspace = \"10\"})")
      ];}

    # Move active window to a workspace with mainMod + SHIFT + [0-9]
    { _args = [
      (lib.generators.mkLuaInline "mod .. \" + SHIFT + 1\"")
      (lib.generators.mkLuaInline "hl.dsp.window.move({workspace = \"1\", follow = false})")
      ];}
    { _args = [
      (lib.generators.mkLuaInline "mod .. \" + SHIFT + 2\"")
      (lib.generators.mkLuaInline "hl.dsp.window.move({workspace = \"2\", follow = false})")
      ];}
    { _args = [
      (lib.generators.mkLuaInline "mod .. \" + SHIFT + 3\"")
      (lib.generators.mkLuaInline "hl.dsp.window.move({workspace = \"3\", follow = false})")
      ];}
    { _args = [
      (lib.generators.mkLuaInline "mod .. \" + SHIFT + 4\"")
      (lib.generators.mkLuaInline "hl.dsp.window.move({workspace = \"4\", follow = false})")
      ];}
    { _args = [
      (lib.generators.mkLuaInline "mod .. \" + SHIFT + 5\"")
      (lib.generators.mkLuaInline "hl.dsp.window.move({workspace = \"5\", follow = false})")
      ];}
    { _args = [
      (lib.generators.mkLuaInline "mod .. \" + SHIFT + 6\"")
      (lib.generators.mkLuaInline "hl.dsp.window.move({workspace = \"6\", follow = false})")
      ];}
    { _args = [
      (lib.generators.mkLuaInline "mod .. \" + SHIFT + 7\"")
      (lib.generators.mkLuaInline "hl.dsp.window.move({workspace = \"7\", follow = false})")
      ];}
    { _args = [
      (lib.generators.mkLuaInline "mod .. \" + SHIFT + 8\"")
      (lib.generators.mkLuaInline "hl.dsp.window.move({workspace = \"8\", follow = false})")
      ];}
    { _args = [
      (lib.generators.mkLuaInline "mod .. \" + SHIFT + 9\"")
      (lib.generators.mkLuaInline "hl.dsp.window.move({workspace = \"9\", follow = false})")
      ];}
    { _args = [
      (lib.generators.mkLuaInline "mod .. \" + SHIFT + 0\"")
      (lib.generators.mkLuaInline "hl.dsp.window.move({workspace = \"0\", follow = false})")
      ];}
  ];
}
