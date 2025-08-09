{
  lib,
  config,
  pkgs,
  ...
}:

lib.mkIf config.optional.podman {

  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
      extraPackages = [ pkgs.podman-compose ];
    };
  };
}
