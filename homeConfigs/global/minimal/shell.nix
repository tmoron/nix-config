{ homeDir, ... }:

{
  home.shell.enableBashIntegration = true;
  home.shellAliases = {
    ls= "ls --color=auto";
    grep = "grep --color=auto";
    vim = "nvim";
    vi = "nvim";
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

  programs.bash.bashrcExtra = ''
    cd() {
      builtin cd "$@"
      echo -n "$PWD" > ~/.last_directory
    }
  
    
    if [ -f ~/.last_directory ] && [ -n "$PS1" ];then
      echo "going to $(cat ~/.last_directory)"
      builtin cd "$(cat ~/.last_directory)"
    fi
  '';
}
