{ pkgs, ... }:
{
  imports = [
    ./go.nix
    ./rust.nix
  ];

  home.packages = with pkgs; [
    # nil
    nixpkgs-fmt
    nixfmt-rfc-style
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
    typstfmt
    tinymist

    # node
    nodejs
    nodePackages.prettier

    # json
    vscode-langservers-extracted

    # build tools
    gcc
    gnumake

    sqlite
  ];
}
