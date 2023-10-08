{
  description = "Gallon's NixOS Configuration";

  nixConfig = { };

  outputs =
    inputs @ { nixpkgs, home-manager, ... }:
    let
      selfPkgs = import ./pkgs;
      commonModules = [
        ./system/configuration.nix
        inputs.sops-nix.nixosModules.sops
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
              ] ++ [
                inputs.hyprland.homeManagerModules.default
              ];
            };
          };
        })
        {
          nixpkgs.overlays = [
            inputs.fenix.overlays.default
            inputs.emacs-overlay.overlay
            inputs.neovim-nightly-overlay.overlay
            selfPkgs.overlay
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
            ./secrets

            ./desktops/hyprland
            # ./desktops/gnome
            # ./desktops/kde
          ] ++ (commonModules);
        };
      };
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    hyprland = {
      url = "github:hyprwm/Hyprland";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
    };

    sops-nix.url = "github:Mic92/sops-nix";

    fenix = {
      url = "github:nix-community/fenix";
    };

    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
    };

    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
    };

    helix = {
      url = "github:helix-editor/helix";
    };
  };
}
