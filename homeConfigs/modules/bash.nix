{ lib, config, ...}:

{
	options.mods.bash.goback = lib.mkOption{
		type = lib.types.bool;
		default = true;
		description = "go back to last cd when starting bash";
	};

	config.programs.bash.bashrcExtra = lib.mkIf config.mods.bash.goback ''
      cd() {
      	builtin cd "$@"
      	echo -n "$PWD" > ~/.last_directory
      }
      [ -z "\$${PS1:-}" ] && return
      
      if [ -f ~/.last_directory ];then
      	echo -n going to
      	cat ~/.last_directory
      	echo
      	builtin cd "$(cat ~/.last_directory)"
      fi
	'';
}
