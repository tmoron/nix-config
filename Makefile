HOST ?= $(file < /etc/nixosFlakeName)
THREADS ?= $(shell nproc)
FLAKE ?= .
MODE ?= switch


FLAGS = --impure --cores $(THREADS) -j $(THREADS) 

ifdef OFFLINE
	FLAGS += --option binary-caches ''
endif

all: os home

update:
	cd $(FLAKE);nix flake update
	$(MAKE) all

os:
	sudo nixos-rebuild $(MODE) $(FLAGS) --flake $(FLAKE)#$(HOST)

vm:
	sudo nixos-rebuild build-vm $(FLAGS) --flake $(FLAKE)#$(HOST)
	./result/bin/*
	rm ./result
	rm ./*.qcow2

hoem : home

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
