{ lib, config, ... }:

lib.mkIf config.optional.wm { services.udiskie.enable = true; }
