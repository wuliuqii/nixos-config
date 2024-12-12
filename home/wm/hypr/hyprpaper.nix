{
  pkgs,
  lib,
  config,
  ...
}:

lib.mkIf config.optional.hypr.enable {
  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = ${config.profile.wallpaper}
    wallpaper = , ${config.profile.wallpaper}
    ipc = off
  '';

  systemd.user.services.hyprpaper = {
    Unit = {
      Description = "Hyprland wallpaper daemon";
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${lib.getExe pkgs.hyprpaper}";
      Restart = "on-failure";
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };
}
