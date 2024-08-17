{ lib, config, ... }:

lib.mkIf config.optional.podman {

  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
    };
  };
}
