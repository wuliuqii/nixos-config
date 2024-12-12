{
  config,
  pkgs,
  lib,
  ...
}:
let
  bgImageSection = name: ''
    #${name} {
      background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/${name}.png"));
    }
  '';
in

lib.mkIf config.optional.wm {
  programs.wlogout = {
    enable = true;

    style =
      if config.profile.darkMode then
        ''
          * {
            background: none;
          }

          window {
          	background-color: rgba(0, 0, 0, .5);
          }

          button {
            background: rgba(0, 0, 0, .05);
            border-radius: 8px;
            box-shadow: inset 0 0 0 1px rgba(255, 255, 255, .1), 0 0 rgba(0, 0, 0, .5);
            margin: 1rem;
            background-repeat: no-repeat;
            background-position: center;
            background-size: 25%;
          }

          button:focus, button:active, button:hover {
            background-color: rgba(255, 255, 255, 0.2);
            outline-style: none;
          }

          ${lib.concatMapStringsSep "\n" bgImageSection [
            "lock"
            "logout"
            "suspend"
            "hibernate"
            "shutdown"
            "reboot"
          ]}
        ''
      else
        ''
          * {
            background-image: none;
            box-shadow: none;
          }

          window {
            background-color: rgba(239, 241, 245, 0.90);
          }

          button {
            border-radius: 0;
            border-color: #dd7878;
            text-decoration-color: #4c4f69;
            color: #4c4f69;
            background-color: #e6e9ef;
            border-style: solid;
            border-width: 1px;
            background-repeat: no-repeat;
            background-position: center;
            background-size: 25%;
          }

          button:focus, button:active, button:hover {
            /* 20% Overlay 2, 80% mantle */
            background-color: rgb(209, 211, 220);
            outline-style: none;
          }

          ${lib.concatMapStringsSep "\n" bgImageSection [
            "lock"
            "logout"
            "suspend"
            "hibernate"
            "shutdown"
            "reboot"
          ]}
        '';
  };
}
