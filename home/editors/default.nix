{ pkgs, ... }:
{
  imports = [
    ./helix.nix
    ./vscode.nix
    ./nvim.nix

    ./dev
  ];

  # home.packages = with pkgs.jetbrains; [
  #   rust-rover
  #   goland
  # ];
}
