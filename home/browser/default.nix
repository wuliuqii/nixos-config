{ pkgs, ... }:
{
  imports = [
    ./firefox
  ];

  home = {
    packages = with pkgs; [
      microsoft-edge-dev
    ];
  };

}
