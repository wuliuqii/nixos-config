{ pkgs, ... }:
{
  imports = [
    # ./helix.nix
    ./vscode.nix

    ./emacs
    ./nvim
  ];

  home.packages = with pkgs; [
    jetbrains.goland
    jetbrains.rust-rover
  ];
}
