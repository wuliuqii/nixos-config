{ lib, config, ... }:

lib.mkIf config.optional.hypr.enable {
  wayland.windowManager.hyprland.settings = {
    # layer rules
    layerrule =
      let
        toRegex =
          list:
          let
            elements = lib.concatStringsSep "|" list;
          in
          "^(${elements})$";

        lowopacity = [
          "bar[0-9]"
          "dock[0-9]"
          "dashboard"
          "notifications[0-9]"
          "quicksettings"
        ];

        highopacity = [
          "anyrun"
          "logout_dialog"
        ];

        blurred = lib.concatLists [
          lowopacity
          highopacity
        ];
      in
      [
        "blur, ${toRegex blurred}"
        "xray 1, ${toRegex [ "bar" ]}"
        "ignorealpha 0.5, ${toRegex (highopacity)}"
        "ignorealpha 0.2, ${toRegex lowopacity}"
      ];

    # window rules
    # use `hyprctl clients` to find out the class and title of a window
    windowrulev2 =
      let
        float-center-apps = "^(one.alynx.showmethekey|pavucontrol|org.gnome.Loupe|org.gnome.Nautilus|org.kde.kdeconnect.daemon|org.kde.kdeconnect-indicator|org.kde.kdeconnect.app|.blueman-manager-wrapped|nm-applet|nm-connection-editor|imv|mpv)$";
        media-apps = "^(swappy|com.github.neithern.g4music|com.gitee.gmg137.NeteaseCloudMusicGtk4|QQ|thunderbird|Slack|org.telegram.desktop|cinny|discord|wechat)$";
      in
      [
        # telegram media viewer
        "float, title:^(Media viewer)$"

        # prismlauncher
        "workspace 5,class:^(org.prismlauncher.PrismLauncher)"
        "float,class:^(org.prismlauncher.PrismLauncher)"

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

        "workspace 10, class:^(steam)$"
        "float, class:^(steam)$, title:^(好友列表)$"

        "dimaround, class:^(xdg-desktop-portal-gtk|polkit-gnome-authentication-agent-1)$"

        "rounding 0, xwayland:1"
        "center, class:^(.*jetbrains.*)$, title:^(Confirm Exit|Open Project|win424|win201|splash)$"
        "size 640 400, class:^(.*jetbrains.*)$, title:^(splash)$"

        "center, class:^(Code)$, title:^(Open Folder|Open File)$"
        "size 60% 60%, class:^(Code)$, title:^(Open Folder|Open File)$"

        "opacity 0.80, class:^(Code|firefox|kitty|neovide|foot|footclient|com.obsproject.Studio)$"
        "opacity 0.80 0.70, class:${float-center-apps}"
        "float, class:${float-center-apps}"
        "center, class:${float-center-apps}"
        "size 60% 60%, class:${float-center-apps}"
        "float, class:${media-apps}"
        "center, class:${media-apps}"
        "size 85% 85%, class:${media-apps}"
        "opacity 0.80 0.70, floating:1"
        "float, class:^(com.github.Aylur.ags)$"
        "float, class:^(org.rgs.*)$"
      ];

    workspace =
      builtins.concatLists (
        builtins.genList (
          x:
          let
            ws =
              let
                c = (x + 1) / 10;
              in
              builtins.toString (x + 1 - (c * 10));
          in
          [ "DP-1, ${ws}" ]
        ) 5
      )
      ++ [ "eDP-1, 1" ];
  };
}
