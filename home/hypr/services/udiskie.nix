{ lib, config, ... }:

lib.mkIf config.optional.hypr { services.udiskie.enable = true; }
