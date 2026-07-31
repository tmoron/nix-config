{ lib, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings.bind = [
    { _args = [
      "XF86MonBrightnessUp"
      (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${lib.getExe pkgs.brightnessctl} s 10%+\")")
      {locked = true; repeating = true; }
      ];}
      
    { _args = [
      "XF86MonBrightnessDown"
      (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${lib.getExe pkgs.brightnessctl} s 10%-\")")
      {locked = true; repeating = true; }
      ];}

    { _args = [
      "XF86KbdBrightnessUp"
      (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${pkgs.asusctl}/bin/asusctl -n\")")
      {locked = true; repeating = true; }
      ];}

    { _args = [
      "XF86KbdBrightnessDown"
      (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${pkgs.asusctl}/bin/asusctl -p\")")
      {locked = true; repeating = true; }
      ];}

    { _args = [
        "Print"
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"hyprshot -m region -o ~/screenshots -f $(date +%Y-%m-%d_%H-%M-%S).png\")")
      ]; }
    { _args = [
        "SHIFT + Print"
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"hyprshot -m output -m active -o ~/screenshots -f $(date +%Y-%m-%d_%H-%M-%S).png\")")
      ]; }
  ];
}
