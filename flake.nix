{
  description = "Gallon's NixOS Configuration";

  nixConfig = { };

  outputs =
    inputs @ { nixpkgs, home-manager, ... }:
    let
      commonModules = [
        ./system/configuration.nix
        inputs.sops-nix.nixosModules.sops
        inputs.hyprland.nixosModules.default
        inputs.home-manager.nixosModules.home-manager
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
                inputs.hyprland.homeManagerModules.default
                inputs.nix-doom-emacs.hmModule
              ];
            };
          };
        })
        {
          nixpkgs.overlays = [
            inputs.fenix.overlays.default
            inputs.go-musicfox.overlays.default
            # inputs.emacs-overlay.overlay
          ];
        }
      ];
    in
    {
      packages.x86_64-linux.default = inputs.fenix.packages.x86_64-linux.minimal.toolchain;
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

    emacs-overlay = {
      url = "github:nix-community/emacs-overlay/c16be6de78ea878aedd0292aa5d4a1ee0a5da501";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-doom-emacs = {
      url = "github:nix-community/nix-doom-emacs";
      inputs.emacs-overlay.follows = "emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix.url = "github:Mic92/sops-nix";

    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    go-musicfox = {
      url = "github:go-musicfox/go-musicfox";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}

