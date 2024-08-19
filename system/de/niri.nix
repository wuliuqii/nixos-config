{
  lib,
  config,
  inputs,
  pkgs,
  ...
}:
{
  imports = [ inputs.niri.nixosModules.niri ];

  config = lib.mkIf config.optional.niri {
    nixpkgs.overlays = [ inputs.niri.overlays.niri ];

    programs.niri = {
      enable = true;
      package = pkgs.niri-unstable;
    };

    services.greetd =
      let
        session = {
          command = "niri-session";
          user = "${config.profile.userName}";
        };
      in
      {
        enable = true;
        settings = {
          terminal.vt = 1;
          default_session = session;
          initial_session = session;
        };
      };
  };
}
