{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    # layer rules
    layerrule =
      let
        layers = "^(system-menu|anyrun|gtk-layer-shell|osd[0-9])$";
      in
      [
        "blur, ${layers}"
        "xray 1, ^(bar|gtk-layer-shell)$"
        "ignorealpha 0.2, ${layers}"
        "ignorealpha 0.5, ^(system-menu|anyrun)$"
      ];

    # window rules
    # use `hyprctl clients` to find out the class and title of a window
    windowrulev2 =
      let
        float-center-apps = "^(pavucontrol|io.github.kaii_lb.Overskride|org.gnome.Settings|org.kde.dolphin|org.kde.kdeconnect.app|.blueman-manager-wrapped|nm-applet|nm-connection-editor|imv|mpv|termfloat)$";
      in
      [
        # telegram media viewer
        "float, title:^(Media viewer)$"

        # make Firefox PiP window floating and sticky
        "float, title:^(Picture-in-Picture)$"
        "pin, title:^(Picture-in-Picture)$"

        # throw sharing indicators away
        "workspace special silent, title:^(Firefox — Sharing Indicator)$"
        "workspace special silent, title:^(.*is sharing (your screen|a window)\.)$"

        # start yesplaymusic in ws10
        "workspace 10 silent, class:^(yesplaymusic)$"

        # idle inhibit while watching videos
        "idleinhibit focus, class:^(mpv|.+exe)$"
        "idleinhibit focus, class:^(firefox)$, title:^(.*YouTube.*)$"
        "idleinhibit fullscreen, class:^(firefox)$"

        "dimaround, class:^(gcr-prompter)$"

        "opacity 0.70 class:^(Code|firefox|org.wezfurlong.wezterm|kitty|foot|yesplaymusic|com.obsproject.Studio)$"
        "opacity 0.80 0.70 class:${float-center-apps}"
        "float, class:${float-center-apps}"
        "center, class:${float-center-apps}"
        "size 60% 60%, class:${float-center-apps}"
      ];

    workspace = [
      "eDP-1, 10"
    ];
  };
}
