{ pkgs, ... }:
{
  imports = [
    ./helix.nix
    ./vscode.nix

    ./emacs
    ./nvim
  ];

  home.packages = with pkgs; [
    # jetbrains-toolbox
  ];
}
