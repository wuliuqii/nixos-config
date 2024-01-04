{ pkgs, ... }:
{
  imports = [
    ./fcitx5
    ./firefox

    ./media.nix
    ./gtk.nix
    ./zathura.nix
    ./cli.nix
  ];

  programs = {
    obs-studio.enable = true;
  };

  home.packages = with pkgs; [
    xdg-utils

    # Social Apps
    telegram-desktop
    discord
    cinny-desktop
    slack
    qq
    thunderbird

    obs-studio-plugins.wlrobs
    obs-studio-plugins.input-overlay

    libsForQt5.kdenlive
    libsForQt5.dolphin
    libsForQt5.dolphin-plugins
    libsForQt5.kio-extras
    libsForQt5.ffmpegthumbs # Video Thumbnails
    libsForQt5.kimageformats # Proprieary Image Formats
    resvg # SVG Thumbnails
    taglib # Audio File Tags
    libsForQt5.kfind # File Search
    libsForQt5.ark # Archive GUI
  ];

  xdg.configFile."dolphinrc".text = ''
    MenuBar=Disabled

    [DetailsMode]
    PreviewSize=22

    [General]
    ShowStatusBar=false
    UseTabForSwitchingSplitView=true
    Version=202

    [IconsMode]
    PreviewSize=160

    [KFileDialog Settings]
    Places Icons Auto-resize=false
    Places Icons Static Size=22
    detailViewIconSize=16

    [KPropertiesDialog]
    ShowPreview=true

    [MainWindow]
    MenuBar=Disabled
    ToolBarsMovable=Disabled

    [MainWindow][Toolbar mainToolBar]
    ToolButtonStyle=IconOnly

    [Toolbar mainToolBar]
    ToolButtonStyle=IconOnly

    [InfomationPanel]
    dateFormat=ShortFormat

    [PlacesPanel]
    IconSize=22
  '';
}
