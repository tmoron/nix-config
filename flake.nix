# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    flake.nix                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/17 18:15:24 by tomoron           #+#    #+#              #
#    Updated: 2024/10/17 19:03:37 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{
  description = "Nixos and home-manager config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
	nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware, ... }@inputs:
	let
	  pkgs = nixpkgs.legacyPackages."x86_64-linux";
      username="tom";
	  homeDir="/home/tom";
	in {
#NIXOS CONFIG
      nixosConfigurations = {
        default = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs; flakeName="default";};
          modules = [
	  	  ./configuration.nix
          ];
        };
	    vbox = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;flakeName="vbox";};
          modules = [
	  	  ./configuration.nix
	  	  ./hosts/vbox.nix
          ];
        };
	    laptop = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;flakeName="laptop";};
          modules = [
	  	  ./configuration.nix
	  	  ./hosts/laptop.nix
		  nixos-hardware.nixosModules.asus-zephyrus-ga401
          ];
        };
	    desktop = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;flakeName="laptop";};
          modules = [
	  	  ./configuration.nix
	  	  ./hosts/desktop.nix
          ];
        };
      };

#HOME CONFIG
      homeConfigurations = {
	    ${username} = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
	      extraSpecialArgs = {
            username = "${username}";
            homeDir = "${homeDir}";
          };
          modules = [ ./home.nix ];
        };
        vbox = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
	      extraSpecialArgs = {
            username = "${username}";
            homeDir = "${homeDir}";
          };
          modules = [
            ./home.nix
            ./homes/vbox.nix
          ];
        };
        ft = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            username = "tomoron";
            homeDir = "/nfs/homes/tomoron";
          };
          modules = [
            ./home.nix
            ./homes/ft/ft.nix
          ];
        };
        laptop = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
	      extraSpecialArgs = {
            username = "${username}";
            homeDir = "${homeDir}";
          };
          modules = [
            ./home.nix
            ./homes/laptop.nix
          ];
        };
        desktop = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
	      extraSpecialArgs = {
            username = "${username}";
            homeDir = "${homeDir}";
          };
          modules = [
            ./home.nix
#			./homes/desktop.nix
          ];
        };
	  };
	};
}
