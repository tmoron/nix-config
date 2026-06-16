{ ... }:
{
  programs.waybar.settings.mainBar = {
    clock = {
      interval  = 1;
      format-alt = "{:%Y-%m-%d}";
      format  = "{:%H:%M:%S}";
    };
  };
}
