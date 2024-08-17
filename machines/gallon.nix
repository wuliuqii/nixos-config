{ ... }:
{
  imports = [ ./common ];

  profile = {
    terminal = "footclient";
  };

  optional = {
    cosmic = false;
    hypr = true;

    podman = false;

    terminal = {
      foot = true;
      kitty = false;
      wezterm = false;
    };

    dev = {
      helix = false;

      rust = true;
      go = false;
      node = true;
      zig = false;
    };
  };

}
