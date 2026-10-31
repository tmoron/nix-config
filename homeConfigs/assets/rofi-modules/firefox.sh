echo "params : $@" 1>&2
echo -e "\0prompt\x1fsearch query >"
echo -e "\0use-hot-keys\x1ftrue"

if [[ -z $1 ]]; then
	echo "home"
	echo "git"
	echo "gh"
	echo "nix"
	exit
fi



case $1 in
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
