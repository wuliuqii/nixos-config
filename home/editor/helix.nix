{ pkgs, inputs, ... }:
{
  programs.helix = {
    enable = true;
    package = inputs.helix.packages."${pkgs.system}".helix;
    settings = {
      theme = "nord";

      editor = {
        line-number = "relative";
        bufferline = "multiple";
        gutters = [ "diff" "diagnostics" "line-numbers" "spacer" ];
        mouse = false;
        indent-guides.render = true;
        cursorline = true;
        true-color = true;
        color-modes = true;
        lsp.display-messages = true;
      };

      keys.normal = {
        C-s = ":w";
        C-q = ":q";
        tab = ":buffer-next";
        S-tab = ":buffer-previous";
        C-x = ":bc";
        C-l = ":fmt";
      };
    };

    languages = {
      language = [
        {
          name = "nix";
          formatter = {
            command = "nixpkgs-fmt";
            auto-format = true;
          };
        }
      ];
      language-server.rust-analyzer.config.check = {
        command = "clippy";
      };
    };
  };
}
