{ inputs, config, ... }:
{
  catppuccin.firefox.enable = true;
  programs.firefox.configPath = "${config.xdg.configHome}/mozilla/firefox";
  programs.firefox = {
    enable = true;
    profiles.default = {
      extensions.packages = with inputs.firefox-addons.packages."x86_64-linux"; 
      [vimium ublock-origin];
  	  extensions.force = true;
    };
  };
}
