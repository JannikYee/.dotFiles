{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-23.11 branch here
    #nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
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
