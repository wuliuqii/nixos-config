{ pkgs
, inputs
, lib
, ...
}:
let
  wallpaper = "${../../wallpaper/catppuccin/evening-sky.png}";
in
{
  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = ${wallpaper}
    wallpaper = , ${wallpaper}

    ipc = off
  '';

  systemd.user.services.hyprpaper = {
    Unit = {
      Description = "Hyprland wallpaper daemon";
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${lib.getExe inputs.hyprpaper.packages.${pkgs.system}.default}";
      Restart = "on-failure";
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };
}
