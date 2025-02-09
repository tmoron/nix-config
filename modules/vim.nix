{config, lib, pkgs, ...}:

{
  home.packages = with pkgs;[
  	clang-tools
	nixd
	nodejs_23
  ];

  home.file = {
    ".config/nvim/init.vim".source = ../dotfiles/config/nvim/init.vim;
    ".vimrc".source = ../dotfiles/vimrc;

	#install plug.vim
	".local/share/nvim/site/autoload/plug.vim".source = "${builtins.fetchGit {
      url = "https://github.com/junegunn/vim-plug";
      rev = "d80f495fabff8446972b8695ba251ca636a047b0";
	  ref = "master"; 
	}}/plug.vim";

	#install stdheader 42
	".config/nvim/plugin/stdheader.vim".source = "${builtins.fetchGit {
      url = "https://github.com/42Paris/42header";
	  rev = "71e6a4df6d72ae87a080282bf45bb993da6146b2";
	  ref = "master";
	}}/plugin/stdheader.vim";
  };
}
