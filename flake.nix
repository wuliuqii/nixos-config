{
  description = "Gallon's NixOS Configuration";

  nixConfig = {
    extra-substituters = [
      "https://hyprland.cachix.org/"
      "https://helix.cachix.org/"
      "https://nix-community.cachix.org"
      "https://anyrun.cachix.org"
    ];
    extra-trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
    ];
    allow-import-from-derivation = true;
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";

    rust-overlay.url = "github:oxalica/rust-overlay";

    hyprland.url = "github:hyprwm/Hyprland";
    hyprpaper.url = "github:hyprwm/hyprpaper";
    hypridle = {
      url = "github:hyprwm/hypridle";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprlock = {
      url = "github:hyprwm/hyprlock";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    helix.url = "github:helix-editor/helix";

    ags.url = "github:Aylur/ags";

    anyrun.url = "github:Kirottu/anyrun";
    anyrun-plugins = {
      url = "github:wuliuqii/anyrun-plugins";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:Mic92/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      selfPkgs = import ./pkgs;
      pkgs = import nixpkgs {
        inherit system;
      };
    in
    {
      nixosConfigurations = {
        laptop = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            ./system/configuration.nix
            ./machines/laptop
            ./secrets

            inputs.sops-nix.nixosModules.sops
            inputs.home-manager.nixosModules.home-manager
            ({ config, ... }: {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs; };
                sharedModules = [
                  (./. + "/machines/${config.machine.userName}.nix")
                  inputs.nix-index-database.hmModules.nix-index
                ];
                users.${config.machine.userName} = {
                  imports = [
                    ./home
                  ] ++ [
                    inputs.hyprland.homeManagerModules.default
                    inputs.ags.homeManagerModules.default
                    inputs.hypridle.homeManagerModules.default
                    inputs.hyprlock.homeManagerModules.default
                    inputs.anyrun.homeManagerModules.default
                  ];
                };
              };
            })

            {
              nixpkgs.overlays = [
                inputs.rust-overlay.overlays.default
                inputs.neovim-nightly.overlay
                selfPkgs.overlay
              ];
            }
          ];
        };
      };

      checks.${system}.pre-commit = inputs.pre-commit-hooks.lib.${system}.run {
        src = ./.;

        hooks = {
          nixpkgs-fmt.enable = true;
        };
      };

      devShells.${system}.default = pkgs.mkShell {
        inherit (self.checks.${system}.pre-commit) shellHook;

        packages = with pkgs; [
          just
          nix-output-monitor
          age
          sops
          nvfetcher
        ];
      };
    };
}
