echo "params : $@" 1>&2
echo -e "\0prompt\x1f>"
echo -e "\0use-hot-keys\x1ftrue"

if [[ -z $1 ]]; then
	exit
fi

args="$*"
first_word="${args%% *}"

case $first_word in
	"home")
		firefox "https://ha.tmoron.fr"
		;;
	"git")
		firefox "https://git.tmoron.fr"
		;;
	"gh")
		firefox "https://github.com"
		;;
	"nix")
		shift
		query=$(echo "$*" | sed 's/ /+/g')
		firefox "https://search.nixos.org/packages?channel=unstable&query=$query"
		;;
	*)
		query=$(echo "$*" | sed 's/ /+/g')
		firefox "https://noai.duckduckgo.com/?q=$query"
		;;
esac
