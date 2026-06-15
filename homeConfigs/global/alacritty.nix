{ ... }:
{
  catppuccin.alacritty.enable = true;
  programs.alacritty = {
    enable = true;
    settings = {
      env.XTERM = "xterm-256color";
      font.size = 9;
    };
  };
}
