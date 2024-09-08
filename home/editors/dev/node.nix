{
  lib,
  config,
  pkgs,
  ...
}:

lib.mkIf config.optional.dev.node {

  home.packages = with pkgs; [
    nodejs
    nodePackages.prettier
    typescript-language-server
    typescript
    deno

    vala-language-server
    vala
  ];
}
