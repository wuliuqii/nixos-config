{ pkgs, ... }:
{
  imports = [
    ./helix.nix
    ./vscode.nix

    ./nvim
    ./dev
  ];

  # home.packages = with pkgs.jetbrains; [
  #   rust-rover
  #   goland
  # ];
}
