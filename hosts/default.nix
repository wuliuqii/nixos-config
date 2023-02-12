{ lib, inputs, nixpkgs, home-manager, nur, fenix, user, location, hyprland, ... }:

let
  system = "x86_64-linux";

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };

  lib = nixpkgs.lib;
in
{
  desktop = lib.nixosSystem {
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
      ./desktop
      ./configuration.nix
      
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
          imports = [(import ./home.nix)] ++ [(import ./desktop/home.nix)];
        };
      }
    ];
  };
}
