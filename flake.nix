{
  description = "Gallon's NixOS Configuration";

  nixConfig = {
    extra-substituters = [
      "https://hyprland.cachix.org/"
      "https://nix-community.cachix.org"
      "https://anyrun.cachix.org"
    ];
    extra-trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager.url = "github:nix-community/home-manager";
    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hyprpaper.url = "github:hyprwm/hyprpaper";
    hyprlock.url = "github:hyprwm/hyprlock";

    ags.url = "github:Aylur/ags";

    anyrun.url = "github:Kirottu/anyrun";
    anyrun-plugins = {
      url = "github:wuliuqii/anyrun-plugins";
      # inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix";

    nix-minecraft = {
      url = "github:Infinidoge/nix-minecraft";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      ...
    }:
    let
      system = "x86_64-linux";
      selfPkgs = import ./pkgs;
      pkgs = import nixpkgs { inherit system; };
    in
    {
      nixosConfigurations = {
        laptop = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./system/configuration.nix
            ./machines/laptop

            inputs.home-manager.nixosModules.home-manager
            inputs.catppuccin.nixosModules.catppuccin
            inputs.nix-minecraft.nixosModules.minecraft-servers
            (
              { config, ... }:
              {
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  extraSpecialArgs = {
                    inherit inputs;
                  };
                  sharedModules = [ (./. + "/machines/${config.machine.userName}.nix") ];
                  users.${config.machine.userName} = {
                    imports =
                      [ ./home ]
                      ++ [
                        inputs.hyprland.homeManagerModules.default
                        inputs.ags.homeManagerModules.default
                        inputs.anyrun.homeManagerModules.default
                        inputs.sops-nix.homeManagerModules.sops
                        inputs.catppuccin.homeManagerModules.catppuccin
                      ];
                  };
                };
              }
            )

            {
              nixpkgs.overlays = [
                inputs.nix-minecraft.overlay
                selfPkgs.overlay
              ];
            }
          ];
        };
      };

      devShells.${system}.default = pkgs.mkShell {
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
