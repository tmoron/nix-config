# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    flake.nix                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/17 18:15:24 by tomoron           #+#    #+#              #
#    Updated: 2025/02/09 02:55:40 by tomoron          ###   ########.fr        #
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

	firefox-addons = {
	  url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
	  inputs.nixpkgs.follows = "nixpkgs";
	};

	plymouth-theme-ycontre-glow = {
      url = "git+file:///home/tom/Desktop/bordel/ycontre-glow";
	};
  };

  outputs = { nixpkgs, home-manager, nixos-hardware, ... }@inputs:
	let
	  pkgs = import nixpkgs { system = "x86_64-linux"; config.allowUnfree = true; };


      osConfig = {flakeName, extraModules ? []}: nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; flakeName = flakeName; };
        modules = nixpkgs.lib.concatLists [ [./osConfigs/global.nix ./osConfigs/hosts/${flakeName}.nix ] extraModules];
      };


	  homeConfig = {flakeName, extraModules ? [], username ? "tom", homeDir ? "/home/tom"}: home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
	    extraSpecialArgs = { inherit inputs; username = username; homeDir = homeDir; };
        modules = nixpkgs.lib.concatLists [ [ ./home.nix ./homes/${flakeName}/home.nix] extraModules ];
	  };

	in {

      nixosConfigurations = {
	    server = osConfig {flakeName = "server";};
	    vbox = osConfig {flakeName = "vbox";};
		laptop = osConfig {flakeName = "laptop"; extraModules = [ nixos-hardware.nixosModules.asus-zephyrus-ga401 ];};
		desktop = osConfig {flakeName = "desktop";};
      };


      homeConfigurations = {
	    vbox = homeConfig { flakeName = "vbox"; };
	    ft = homeConfig { flakeName = "ft"; username = "tomoron"; homeDir = "/nfs/homes/tomoron";};
	    laptop = homeConfig { flakeName = "laptop"; };
	    desktop = homeConfig { flakeName = "desktop"; };
	    server = homeConfig { flakeName = "server"; };
	  };
    };
}
