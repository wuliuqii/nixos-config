{ pkgs, ... }:
{
  imports = [
    ./go.nix
    ./rust.nix
    ./zig.nix
    ./node.nix
  ];

  home.packages = with pkgs; [
    # nil
    nixpkgs-fmt
    nixfmt-rfc-style
    nil
    nixd

    # markdown
    marksman
    markdownlint-cli
    markdownlint-cli2
    markdown-oxide

    # lua
    lua-language-server
    stylua

    # typst
    typstfmt
    tinymist

    # json
    vscode-langservers-extracted

    # build tools
    shellcheck
    gcc
    gnumake
    pkg-config
  ];
}
