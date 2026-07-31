{ lib, ... }:

{
  wayland.windowManager.hyprland.settings = {
    curve = [
      { _args = [
        "easeInOut"
        { type = "bezier"; points = lib.generators.mkLuaInline "{ {0.77, 0}, {0.175, 1} }"; }
      ];}

      { _args = [
        "easeOut"
        { type = "bezier"; points = lib.generators.mkLuaInline "{ {0.24, 0.66}, {0.04, 1} }"; }
      ];}
    ];
    animation = [
      {leaf = "windows"; enabled = true; speed = 2; bezier = "easeInOut";}
      {leaf = "windowsIn"; enabled = true; speed = 2; bezier = "easeInOut"; style = "slide";}
      {leaf = "windowsOut"; enabled = true; speed = 2; bezier = "easeInOut"; style = "slide";}
      {leaf = "fade"; enabled = true; speed = 2; bezier = "easeInOut";}
      {leaf = "workspaces"; enabled = true; speed = 2; bezier = "easeOut";}
	  ];

  };
}
