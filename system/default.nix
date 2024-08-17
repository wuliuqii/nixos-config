{ ... }:
{
  imports = [
    ./de/hypr.nix
    # ./de/cosmic.nix

    ./configuration.nix
    ./font.nix
    ./hardware.nix
    ./security.nix
    ./services.nix
    ./virtualisation.nix
    ./network.nix
  ];
}
