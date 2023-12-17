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
        float-center-apps = "^(org.kde.kdeconnect.app|.blueman-manager-wrapped|nm-applet|nm-connection-editor|imv|mpv|termfloat)$";
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

        # start yesplaymusic in ws9
        "workspace 9 silent, class:^(yesplaymusic)$"

        # idle inhibit while watching videos
        "idleinhibit focus, class:^(mpv|.+exe)$"
        "idleinhibit focus, class:^(firefox)$, title:^(.*YouTube.*)$"
        "idleinhibit fullscreen, class:^(firefox)$"

        "dimaround, class:^(gcr-prompter)$"

        "opacity 0.80 0.80 class:^(firefox|code-url-handler|kitty|foot|yesplaymusic|org.kde.dolphin|com.obsproject.Studio)$"
        "opacity 0.80 0.70 class:${float-center-apps}"
        "float, class:${float-center-apps}"
        "move 25%-, class:${float-center-apps}"
        "size 960 540, class:${float-center-apps}"
      ];
  };
}
