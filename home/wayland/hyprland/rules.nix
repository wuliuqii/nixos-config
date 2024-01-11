{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    # layer rules
    layerrule =
      let
        layers = "^(bar[0-9]|dock[0-9]|notifications[0-9]|quicksettings|powermenu|dashboard|applauncher)$";
      in
      [
        "blur, ${layers}"
      ];

    # window rules
    # use `hyprctl clients` to find out the class and title of a window
    windowrulev2 =
      let
        float-center-apps = "^(one.alynx.showmethekey|pavucontrol|org.gnome.Settings|org.kde.dolphin|org.kde.kdeconnect-indicator|org.kde.kdeconnect.app|.blueman-manager-wrapped|nm-applet|nm-connection-editor|imv|mpv|termfloat)$";
        media-apps = "^(swappy|com.github.neithern.g4music|YouTube Music|yesplaymusic|QQ|thunderbird|Slack|org.telegram.desktop|cinny|discord)$";
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

        # idle inhibit while watching videos
        "idleinhibit focus, class:^(mpv|.+exe)$"
        "idleinhibit focus, class:^(firefox)$, title:^(.*YouTube.*)$"
        "idleinhibit fullscreen, class:^(firefox)$"

        "dimaround, class:^(gcr-prompter)$"

        "opacity 0.70, class:^(Code|firefox|org.wezfurlong.wezterm|kitty|foot|yesplaymusic|com.obsproject.Studio)$"
        "opacity 0.80 0.70, class:${float-center-apps}"
        "float, class:${float-center-apps}"
        "center, class:${float-center-apps}"
        "size 60% 60%, class:${float-center-apps}"
        "opacity 0.80 0.70, class:${media-apps}"
        "float, class:${media-apps}"
        "center, class:${media-apps}"
        "size 90% 90%, class:${media-apps}"
        "float, class:^(showmethekey-gtk)$"
        "pin, class:^(showmethekey-gtk)$"
        "opacity 0.50, class:^(showmethekey-gtk)$"
        "move 50% 85%, class:^(showmethekey-gtk)$"
      ];

    workspace = builtins.concatLists
      (builtins.genList
        (
          x:
          let
            ws =
              let
                c = (x + 1) / 10;
              in
              builtins.toString (x + 1 - (c * 10));
          in
          [
            "DP-3, ${ws}"
          ]
        )
        5) ++ [
      "eDP-1, 6"
    ];
  };
}
