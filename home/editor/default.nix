{ pkgs, ... }:
{
  imports = [
    ./helix.nix
    ./vscode.nix

    ./emacs
  ];

  home.packages = with pkgs; [
    neovim-nightly
  ];
}
