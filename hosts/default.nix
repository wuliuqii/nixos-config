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
      ./system.nix
    ] ++ [
      inputs.hyprland.nixosModules.default
      inputs.home-manager.nixosModules.home-manager
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
