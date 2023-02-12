{
  description = "My Personal NixOS and Darwin System Flake Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
    };

    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:vaxerski/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    nur,
    fenix,
    hyprland,
    ...
  }:
  let
    overlays = {pkgs, ...}: {
      nixpkgs.overlays = with inputs;
      [
        fenix.overlays.default
      ];
    };

    lib = nixpkgs.lib;

    user = "gallon";
    location = "$HOME/.setup";
    system = "x86_64-linux";
  in
  {
    defaultPackage.x86_64-linux = fenix.packages.x86_64-linux.minimal.toolchain;
    nixosConfigurations.desktop = lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit inputs user location;
        host = {
          hostName = "desktop";
          mainMonitor = "DP-1";
        };
      };
      modules = [
        nur.nixosModules.nur
        hyprland.nixosModules.default
        overlays
        ./hosts/desktop
        ./hosts/configuration.nix
      
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = {
            inherit user;
            host = {
              hostName = "desktop";
              mainMonitor = "DP-1";
            };
          };
          home-manager.users.${user} = {
            imports = [(import ./hosts/home.nix)] ++ [(import ./hosts/desktop/home.nix)];
          };
        }
      ];
    };
  };
}
