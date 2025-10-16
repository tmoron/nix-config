HOST ?= $(file < /etc/nixosFlakeName)
THREADS ?= $(shell nproc)
FLAKE ?= .
MODE ?= boot

FLAGS = --impure --cores $(THREADS) -j $(THREADS) 

all: os home

update:
	cd $(FLAKE);nix flake update
	$(MAKE) all

os:
	sudo nixos-rebuild $(MODE) $(FLAGS) --flake $(FLAKE)#$(HOST)
home :
	home-manager switch $(FLAGS) --flake $(FLAKE)#$(HOST)

iso :
	nix build ".#nixosConfigurations.iso.config.system.build.isoImage" $(FLAGS)
	cp result/iso/*.iso nixos.iso
	rm -rf result

cleanup :
	sudo nix-env --delete-generations +1 --profile /nix/var/nix/profiles/system
	nix-env --delete-generations +1 --profile ~/.local/state/nix/profiles/home-manager
	nix-env --delete-generations +1
	sudo nix-collect-garbage -d

optimize :
	nix-store --optimize -vv
