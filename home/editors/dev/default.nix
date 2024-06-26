{ pkgs, ... }:
{
  imports = [
    ./go.nix
    ./rust.nix
  ];

  home.packages = with pkgs; [
    # nil
    nixpkgs-fmt
    nil

    # markdown
    marksman

    # lua
    lua-language-server
    stylua

    # zig
    zig
    zls

    # typst
    typst-preview
    typstfmt
    tinymist

    # node
    nodejs
    nodePackages.prettier

    # build tools
    gcc
    gnumake

    sqlite
  ];
}
