{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    window_rule = [
      { _args = [
        {match = { class = "(pinentry-)(.*)"; };}
        {stay_focused = true;}
      ];}
    ];

    layer_rule = [
      { _args = [
  	    {
          name = "no_anim_for_selection";
          no_anim = true;
          match = { namespace = "selection"; };
        }
      ];}
    ];
  };
}
