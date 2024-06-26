{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-23.11 branch here
    #nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    home-manager,
    nixpkgs
  }: let 
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in{
    nixosConfigurations = {
      nixos-desktop = lib.nixosSystem {
        inherit system;
        modules = [
          ./desktop/base.nix
        ];
      };
    };
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
        modules = [
          ./laptop/base.nix
        ];
      };
    };
    nixosConfigurations = {
      nixos-desktop-hp = lib.nixosSystem {
        inherit system;
        modules = [
          ./desktop-hp/base.nix
        ];
      };
    };
    nixosConfigurations = {
      desktop-nas = lib.nixosSystem {
        inherit system;
        modules = [
          ./desktop-nas/base.nix
        ];
      };
    };
    homeConfigurations = {
      "jannik@nixos-desktop" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [./desktop/home.nix];
      };
    };
    homeConfigurations = {
      "jannik@nixos" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [./laptop/home.nix];
      };
    };
    homeConfigurations = {
      "jannik@nixos-desktop-hp" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [./desktop-hp/home.nix];
      };
    };
    homeConfigurations = {
      "jannik@desktop-nas" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [./desktop-nas/home.nix];
      };
    };
  };

  

  #outputs = { self, nixpkgs, ... }@inputs: {
  #  # Please replace my-nixos with your hostname
  #  nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
  #    system = "x86_64-linux";
  #    modules = [
  #      # Import the previous configuration.nix we used,
  #      # so the old configuration file still takes effect
  #      ./Desktop/configuration.nix
  #    ];
  #  };
  #};
}
