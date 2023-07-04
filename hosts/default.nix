{ system, nixpkgs, inputs, user, ... }:

let
  lib = nixpkgs.lib;
in
{
  laptop = lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs user; };
    modules = [
      ./wayland
    ] ++ [
      ../secrets
      ./system.nix
    ] ++ [
      { nixpkgs.overlays = [ inputs.fenix.overlays.default ]; }
      inputs.hyprland.nixosModules.default
      inputs.home-manager.nixosModules.home-manager
      inputs.sops-nix.nixosModules.sops
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = { inherit user; };
          users.${user} = {
            imports = [
              (import ./wayland/home.nix)
            ] ++ [
              inputs.hyprland.homeManagerModules.default
            ];
          };
        };
      }
    ];
  };
}
