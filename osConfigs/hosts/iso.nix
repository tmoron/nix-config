{ ... }:

{
  imports = [ ../packages.nix ];
  
  environment.etc."skel/nix-config".source = "${builtins.fetchGit {
		url = "https://github.com/ARandomPig/nix-config";
		rev = "6982747ec65962a13dd07948b2317d8d571f39b8";
		ref = "master";
    }}";
  
  system.activationScripts.populateUser.text = ''
	mkdir -p /home/nixos
	cp -r /etc/skel/nix-config
	chown -R nixos:nixos /home/nixos/nix-config
  '';
}
