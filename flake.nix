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
                inputs.anyrun.homeManagerModules.default
                inputs.ags.homeManagerModules.default
              ];
            };
          };
        })
        {
          nixpkgs.overlays = [
            inputs.fenix.overlays.default
            selfPkgs.overlay
          ];
        }
      ];
    in
    {
      packages.x86_64-linux.default = inputs.fenix.packages.x86_64-linux.minimal.toolchain;
      nixosConfigurations = {
        laptop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./machines/laptop
            ./secrets
          ] ++ (commonModules);
        };
      };
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-vscode.url = "github:nixos/nixpkgs/db9208ab987cdeeedf78ad9b4cf3c55f5ebd269b";

    home-manager.url = "github:nix-community/home-manager";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprpaper.url = "github:hyprwm/hyprpaper";
    sops-nix.url = "github:Mic92/sops-nix";
    fenix.url = "github:nix-community/fenix";
    helix.url = "github:helix-editor/helix";
    anyrun.url = "github:Kirottu/anyrun";
    ags.url = "github:Aylur/ags";
  };
}
