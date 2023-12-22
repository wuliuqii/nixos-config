{ pkgs, lib, ... }:
let
  # use OCR and copy to clipboard
  ocrScript =
    let
      inherit (pkgs) grim libnotify slurp tesseract5 wl-clipboard;
      _ = lib.getExe;
    in
    pkgs.writeShellScriptBin "wl-ocr" ''
      ${_ grim} -g "$(${_ slurp})" -t ppm - | ${_ tesseract5} - - | ${wl-clipboard}/bin/wl-copy
      ${_ libnotify} "$(${wl-clipboard}/bin/wl-paste)"
    '';
in
{
  imports = [
    ./waybar
    ./hyprland

    ./ags.nix
    ./mako.nix
    ./swaylock.nix
    ./anyrun.nix
    ./wlogout.nix
  ];

  home.packages = with pkgs; [
    wl-clipboard
    cliphist
    wlr-randr
    grimblast
    slurp
    udiskie
    networkmanagerapplet
    wlogout
    ocrScript
    brillo
    swww
    qt6.qtwayland
    libsForQt5.qt5.qtwayland
  ];

  # make stuff work on wayland
  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
  };

  # fake a tray to let apps start
  # https://github.com/nix-community/home-manager/issues/2064
  systemd.user.targets.tray = {
    Unit = {
      Description = "Home Manager System Tray";
      Requires = [ "graphical-session-pre.target" ];
    };
  };
}
