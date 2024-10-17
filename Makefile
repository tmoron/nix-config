HOST ?= $(file < /etc/nixosFlakeName)
THREADS ?= $(shell nproc)
FLAKE ?= /home/tom/home
MODE = switch

all: os home

update:
	cd $(FLAKE);nix flake update
	$(MAKE) all

os:
	sudo nixos-rebuild $(MODE) --cores $(THREADS) -j $(THREADS) --flake $(FLAKE)#$(HOST)
home :
	home-manager $(MODE) --cores $(THREADS) -j $(THREADS) --flake $(FLAKE)#$(HOST)
