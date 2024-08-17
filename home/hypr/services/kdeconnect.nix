{
  lib,
  config,
  pkgs,
  ...
}:

lib.mkIf config.optional.hypr {
  # KDEConnect user service
  systemd.user.services.kdeconnect = {
    Unit.Description = "KDEConnect Service";
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.kdeconnect}/bin/kdeconnect-indicator";
      TimeoutStopSec = 5;
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };
}
