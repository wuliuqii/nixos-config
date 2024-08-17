{ inputs, ... }:
{
  imports = [
    ./cosmic.nix
    ./hypr.nix

    inputs.nixos-cosmic.nixosModules.default
  ];
}
