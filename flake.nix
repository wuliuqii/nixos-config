{
  description = "Gallon's NixOS Configuration";

  nixConfig = { };

  outputs =
    inputs @ { nixpkgs
    , home-manager
    , hyprland
    , hypr-contrib
    , sops-nix
    , fenix
    , joshuto
    , go-musicfox
    , ...
    }:
    let
      commonModules = [
        ./system/configuration.nix
        sops-nix.nixosModules.sops
        hyprland.nixosModules.default
        home-manager.nixosModules.home-manager
        ({ config, ... }: {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit inputs; };
            sharedModules = [
              (./. + "/machines/${config.machine.userName}.nix")
            ];
            users.${config.machine.userName} = {
              imports = [
                ./home
                ./modules/nord-theme/wayland
              ] ++ [
                hyprland.homeManagerModules.default
              ];
            };
          };
        })
        {
          nixpkgs.overlays = [
            fenix.overlays.default
            joshuto.overlays.default
            go-musicfox.overlays.default
          ];
        }
      ];
    in
    {
      packages.x86_64-linux.default = fenix.packages.x86_64-linux.minimal.toolchain;
      nixosConfigurations = {
        gallon-mechrevo = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./machines/gallon-mechrevo
            ./home/desktop
            ./secrets
          ] ++ (commonModules);
        };
      };
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hypr-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix.url = "github:Mic92/sops-nix";

    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    joshuto.url = "github:kamiyaa/joshuto";
    go-musicfox.url = "github:go-musicfox/go-musicfox";
  };
}

