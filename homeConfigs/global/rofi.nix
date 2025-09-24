{ ... }:
{
  programs.rofi = {
    enable = true;
	theme = "rounded-nord-dark";
  };

  home.file.".local/share/rofi/themes".source = "${builtins.fetchGit {
  	url = "https://github.com/newmanls/rofi-themes-collection";
  	rev = "c8239a45edced3502894e1716a8b661fdea8f1c9";
  	ref = "master";
  }}/themes";
}
