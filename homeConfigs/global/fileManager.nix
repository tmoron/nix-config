{ ... }: 
{
  programs.yazi = {
    enable = true;
	settings.mgr.sort_dir_first=false;
  };

  home.sessionVariables.BROWSER = "yazi";
  programs.yazi.shellWrapperName = "y";
}
