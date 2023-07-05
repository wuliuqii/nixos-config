{
  description = "My Personal NixOS Configuration";

  nixConfig = { };

  outputs =inputs @ { nixpkgs, ... }:
    let
      user = "gallon";
    in
    {
      packages.x86_64-linux.default = inputs.fenix.packages.x86_64-linux.minimal.toolchain;
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
    };
}
