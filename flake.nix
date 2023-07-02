{
  description = "My Personal NixOS Configuration";

  nixConfig = { };

  outputs = inputs @ { nixpkgs, ... }:
    let
      user = "gallon";
    in
    {
      nixosConfigurations = (
        import ./hosts {
          system = "x86_64-linux";
          inherit nixpkgs inputs user;
        }
      );
    };

  inputs =
    {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
      hyprland = {
        url = "github:hyprwm/Hyprland";
        inputs.nixpkgs.follows = "nixpkgs";
      };
      home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
      };
    };
}
