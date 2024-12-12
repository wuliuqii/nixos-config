{ pkgs, ... }:
{
  imports = [ ./common ];

  profile = {
    terminal = "footclient";
    font = "MonoLisa";
    darkMode = false;
    browser = "zen";
    wallpaper = "${pkgs.wallpaper}/7qlsln.jpg";
  };

  optional = {
    cosmic = false;
    wm = true;
    hypr = {
      enable = true;
    };
    niri = false;

    podman = false;

    terminal = {
      foot = true;
      kitty = false;
      wezterm = false;
    };

    dev = {
      helix = true;
      zed = true;
      vscode = false;

      rust = true;
      go = false;
      node = true;
      zig = false;
    };
  };

}
