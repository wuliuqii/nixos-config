{ pkgs, ... }:
{
  home.packages = with pkgs; [
    typescript
    nodejs
    bun
  ];
}
