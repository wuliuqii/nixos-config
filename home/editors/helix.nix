{ pkgs, inputs, config, ... }:
let
  github_copilot = builtins.fromJSON (builtins.readFile
    "${config.xdg.configHome}/github-copilot/hosts.json");
in
{
  programs.helix = {
    enable = true;
    # TODO: https://github.com/helix-editor/helix/pull/9867
    # package = inputs.helix.packages."${pkgs.system}".helix;
    settings = {
      theme = "catppuccin_macchiato";

      editor = {
        line-number = "relative";
        bufferline = "multiple";
        gutters = [ "diff" "diagnostics" "line-numbers" "spacer" ];
        idle-timeout = 100;
        auto-save = true;
        mouse = false;
        indent-guides.render = true;
        cursorline = true;
        true-color = true;
        color-modes = true;
        soft-wrap.enable = true;
        lsp = {
          # display-inlay-hints = true;
          display-messages = true;
        };
        cursor-shape = {
          insert = "bar";
        };
      };

      keys.normal = {
        C-s = ":w";
        C-q = ":q";
        L = ":bn";
        H = ":bp";
        C-x = ":bc";
        space.l.f = ":fmt";
        space."." = "file_picker";
        space."," = "buffer_picker";
      };
    };

    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter = {
            command = "nixpkgs-fmt";
          };
          language-servers = [ "nil" "copilot" ];
        }
        {
          name = "rust";
          language-servers = [ "rust-analyzer" "copilot" ];
        }
      ];

      language-server = with pkgs; {
        copilot = {
          command = "${helix-gpt}/bin/helix-gpt";
          args = [
            "--handler"
            "copilot"
            "--copilotApiKey"
            "${github_copilot."github.com"."oauth_token"}"
          ];
        };
        codeium = {
          command = "${helix-gpt}/bin/helix-gpt";
          args = [ "--handler" "codeium" ];
        };
        rust-analyzer.config.check = {
          command = "clippy";
        };
      };
    };
  };
}

