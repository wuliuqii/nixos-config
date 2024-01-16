{ pkgs, ... }:
{
  home.packages = with pkgs; [
    typescript
    nodejs
    nodePackages.eslint
    bun
  ];
}
