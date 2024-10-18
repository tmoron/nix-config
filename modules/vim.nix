{config, lib, pkgs, ...}:

{
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
	  rev = "9f51db5cc483951e257aece66f1f4ce3b14cdab1";
	  ref = "master";
	}}/plugin/stdheader.vim";
  };
}
