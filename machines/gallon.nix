{ ... }:
{
  imports = [ ./common ];

  profile = {
    terminal = "footclient";
  };

  optional = {
    cosmic = false;
    wm = true;
    hypr = {
      enable = false;
      scroller = false;
    };
    niri = true;

    podman = false;

    terminal = {
      foot = true;
      kitty = true;
      wezterm = true;
    };

    dev = {
      helix = false;
      zed = true;
      vscode = false;

      rust = true;
      go = false;
      node = true;
      zig = false;
    };
  };

}
