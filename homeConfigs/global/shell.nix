{ homeDir, ... }:
{
  home.shell.enableBashIntegration = true;
  home.shellAliases = {
    ls= "ls --color=auto";
    grep = "grep --color=auto";
    vim = "nvim";
    vi = "nvim";
    hl = "Hyprland";
    clr = "clear";
	noidle = "systemctl --user stop hypridle";
  };

  programs.bash.profileExtra = ''
	PATH=$PATH:${homeDir}/.cargo/bin
  '';

  programs.direnv.enable = true;
  programs.direnv.enableBashIntegration = true;
  
  programs.bash = {
	enable = true;
    historyControl = ["ignoreboth"];
	historyIgnore = [ "ls" "cd" "exit" ];
	shellOptions = [ "cdspell" "autocd"];
  };
}
