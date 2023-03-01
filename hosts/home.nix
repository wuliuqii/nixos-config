#
#  General Home-manager configuration
#
#  flake.nix
#   ├─ ./hosts
#   │   └─ home.nix *
#   └─ ./modules
#       ├─ ./editors
#       │   └─ default.nix
#       ├─ ./programs
#       │   └─ default.nix
#       └─ ./services
#           └─ default.nix
#

{ config, lib, pkgs, user, ... }:

{
  imports = # Home Manager Modules
    (import ../modules/editors) ++
    (import ../modules/programs) ++
    (import ../modules/services);

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";

    packages = with pkgs; [
      # Terminal
      pfetch # Minimal fetch
      ranger # File Manager
      tldr # Helper
      ripgrep
      fd

      # Video/Audio
      feh # Image Viewer
      mpv # Media Player
      pavucontrol # Audio Control
      vlc # Media Player

      # Apps
      appimage-run # Runs AppImages on NixOS
      firefox # Browser
      microsoft-edge-dev # Browser

      # File Management
      okular # PDF Viewer
      gnome.file-roller # Archive Manager
      pcmanfm # File Manager
      rsync # Syncer - $ ssync -r dir1/ dir2/
      unzip # Zip Files
      unrar # Rar Files

      obs-studio # Recording/Live Streaming
      keyd
      v2raya

      gcc
      nodejs

      yesplaymusic
    ];
    file.".config/themes/wallpaper.jpg".source = ../modules/themes/wallpaper.jpg;
    file.".config/themes/winter-wall.png".source = ../modules/themes/winter-wall.png;
    file.".config/themes/wall".source = ../modules/themes/wall;
    file.".config/themes/wall.mp4".source = ../modules/themes/wall.mp4;
    pointerCursor = {
      # This will set cursor system-wide so applications can not choose their own
      gtk.enable = true;
      #name = "Dracula-cursors";
      #name = "Catppuccin-Mocha-Dark-Cursors";
      name = "Catppuccin-Macchiato-Pink-Cursors";
      #package = pkgs.dracula-theme;
      #package = pkgs.catppuccin-cursors.mochaDark;
      package = pkgs.catppuccin-cursors.macchiatoPink;
      size = 24;
    };
    stateVersion = "22.11";
  };

  programs = {
    home-manager.enable = true;
  };

  gtk = {
    # Theming
    enable = true;
    theme = {
      #name = "Dracula";
      #name = "Catppuccin-Dark";
      name = "Catppuccin-Macchiato-Standard-Pink-Dark";
      #package = pkgs.dracula-theme;
      package = pkgs.catppuccin-gtk;
    };
    iconTheme = {
      #name = "Papirus-Dark";
      name = "Macchiato-Pink";
      package = pkgs.papirus-icon-theme;
    };
    font = {
      name = "JetBrains Mono Medium"; # or FiraCode Nerd Font Mono Medium
    }; # Cursor is declared under home.pointerCursor
  };
}
