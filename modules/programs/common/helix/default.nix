{ ... }:
{
  programs.helix = {
    enable = true;
    settings = {
      theme = "nord";

      editor = {
        line-number = "relative";
        bufferline = "multiple";
        indent-guides.render = true;
        cursorline = true;
        true-color = true;
        color-modes = true;
        lsp.display-messages = true;
      };

      keys.normal = {
        C-s = ":w";
        C-q = ":q";
        C-o = ":open ~/.config/helix/config.toml";
        tab = ":buffer-next";
        S-tab = ":buffer-previous";
        C-x = ":bc";
      };
      keys.insert = {
        j = {
          k = "normal_mode";
        };
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
