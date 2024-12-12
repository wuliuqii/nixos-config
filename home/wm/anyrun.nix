{
  lib,
  config,
  inputs,
  pkgs,
  ...
}:
let
  anyrunPkgs = inputs.anyrun.packages.${pkgs.system};
in
{
  imports = [ inputs.anyrun.homeManagerModules.default ];

  config = lib.mkIf config.optional.wm {
    programs.anyrun = {
      enable = true;

      config = {
        plugins = [
          anyrunPkgs.applications
        ];

        width.fraction = 0.3;
        y.absolute = 15;
        closeOnClick = true;
        ignoreExclusiveZones = false;
        layer = "overlay";
        hidePluginInfo = true;
        hideIcons = false;
      };

      extraCss =
        if config.profile.darkMode then
          ''
            * {
              all: unset;
              font-size: 1.3rem;
            }
            #window,
            #match,
            #entry,
            #plugin,
            #main {
              background: transparent;
            }
            #match.activatable {
              border-radius: 16px;
              padding: 0.3rem 0.9rem;
              margin-top: 0.01rem;
            }
            #match.activatable:first-child {
              margin-top: 0.7rem;
            }
            #match.activatable:last-child {
              margin-bottom: 0.6rem;
            }
            #plugin:hover #match.activatable {
              border-radius: 10px;
              padding: 0.3rem;
              margin-top: 0.01rem;
              margin-bottom: 0;
            }
            #match:selected,
            #match:hover,
            #plugin:hover {
              background: rgba(255, 255, 255, 0.1);
            }
            #entry {
              background: rgba(255, 255, 255, 0.05);
              border: 1px solid rgba(255, 255, 255, 0.1);
              border-radius: 16px;
              margin: 0.5rem;
              padding: 0.3rem 1rem;
            }
            list > #plugin {
              border-radius: 16px;
              margin: 0 0.3rem;
            }
            list > #plugin:first-child {
              margin-top: 0.3rem;
            }
            list > #plugin:last-child {
              margin-bottom: 0.3rem;
            }
            list > #plugin:hover {
              padding: 0.6rem;
            }
            box#main {
              background: rgba(0, 0, 0, 0.5);
              box-shadow:
                inset 0 0 0 1px rgba(255, 255, 255, 0.1),
                0 0 0 1px rgba(0, 0, 0, 0.5);
              border-radius: 24px;
              padding: 0.3rem;
            }
          ''
        else
          ''
            * {
              all: unset;
              font-size: 1.2rem;
              color: black;
            }

            #window,
            #match,
            #entry,
            #plugin,
            #main {
              background: transparent;
            }

            #match.activatable {
              border-radius: 8px;
              margin: 4px 0;
              padding: 4px;
              /* transition: 100ms ease-out; */
            }
            #match.activatable:first-child {
              margin-top: 12px;
            }
            #match.activatable:last-child {
              margin-bottom: 0;
            }

            #match:hover {
              background: rgba(255, 255, 255, 0.05);
            }
            #match:selected {
              background: rgba(255, 255, 255, 0.1);
            }

            #entry {
              background: rgba(255, 255, 255, 0.05);
              border: 1px solid rgba(255, 255, 255, 0.1);
              border-radius: 8px;
              padding: 4px 8px;
            }

            box#main {
              background: rgba(200, 200, 200, 0.5);
              box-shadow:
                inset 0 0 0 1px rgba(255, 255, 255, 0.1),
                0 30px 30px 15px rgba(0, 0, 0, 0.5);
              border-radius: 20px;
              padding: 12px;
            }
          '';
    };
  };
}
