{
  description = "Gallon's NixOS Configuration";

  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
      "https://cosmic.cachix.org/"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager.url = "github:nix-community/home-manager";
    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";

    nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";

    sops-nix = {
      url = "github:Mic92/sops-nix";
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

            inputs.nixos-cosmic.nixosModules.default
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
                  ];
                };
              };
            })

            {
              nixpkgs.overlays = [
                inputs.neovim-nightly.overlay
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
