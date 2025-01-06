{
  lib,
  config,
  pkgs,
  ...
}:
lib.mkIf config.optional.dev.helix {
  catppuccin.helix.enable = true;
  programs.helix = {
    enable = true;
    extraPackages = with pkgs; [
      markdown-oxide
      nodePackages.vscode-langservers-extracted
      shellcheck
    ];
    settings = {
      editor = {
        line-number = "relative";
        bufferline = "multiple";
        gutters = [
          "diff"
          "diagnostics"
          "line-numbers"
          "spacer"
        ];
        idle-timeout = 100;
        auto-save = false;
        mouse = false;
        indent-guides.render = true;
        cursorline = true;
        true-color = true;
        color-modes = true;
        completion-trigger-len = 1;
        completion-replace = true;
        soft-wrap.enable = true;
        lsp = {
          display-inlay-hints = false;
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
      language =
        let
          deno = lang: {
            command = lib.getExe pkgs.deno;
            args = [
              "fmt"
              "-"
              "--ext"
              lang
            ];
          };

          prettier = lang: {
            command = lib.getExe pkgs.nodePackages.prettier;
            args = [
              "--parser"
              lang
            ];
          };
          prettierLangs = map (e: {
            name = e;
            formatter = prettier e;
          });
          langs = [
            "css"
            "scss"
            "html"
          ];
        in
        [
          {
            name = "nix";
            auto-format = true;
            language-servers = [
              "nil"
            ];
          }
          {
            name = "javascript";
            auto-format = true;
            language-servers = [
              "dprint"
              "typescript-language-server"
            ];
          }
          {
            name = "typescript";
            auto-format = true;
            language-servers = [
              "dprint"
              "typescript-language-server"
            ];
          }
          {
            name = "json";
            formatter = deno "json";
          }
          {
            name = "markdown";
            language-servers = [
              "dprint"
              "markdown-oxide"
            ];
          }
        ]
        ++ prettierLangs langs;

      language-server = {
        nil = {
          command = lib.getExe pkgs.nil;
          config.nil.formatting.command = [
            "nixfmt"
          ];
        };

        deno-lsp = {
          command = lib.getExe pkgs.deno;
          args = [ "lsp" ];
          environment.NO_COLOR = "1";
          config.deno = {
            enable = true;
            lint = true;
            unstable = true;
            suggest = {
              completeFunctionCalls = false;
              imports = {
                hosts."https://deno.land" = true;
              };
            };
            inlayHints = {
              enumMemberValues.enabled = true;
              functionLikeReturnTypes.enabled = true;
              parameterNames.enabled = "all";
              parameterTypes.enabled = true;
              propertyDeclarationTypes.enabled = true;
              variableTypes.enabled = true;
            };
          };
        };

        dprint = {
          command = lib.getExe pkgs.dprint;
          args = [ "lsp" ];
        };

        typescript-language-server = {
          command = lib.getExe pkgs.nodePackages.typescript-language-server;
          args = [ "--stdio" ];
          config = {
            typescript-language-server.source = {
              addMissingImports.ts = true;
              fixAll.ts = true;
              organizeImports.ts = true;
              removeUnusedImports.ts = true;
              sortImports.ts = true;
            };
          };
        };

        vscode-css-language-server = {
          command = "${pkgs.nodePackages.vscode-langservers-extracted}/bin/vscode-css-languageserver";
          args = [ "--stdio" ];
          config = {
            provideFormatter = true;
            css.validate.enable = true;
            scss.validate.enable = true;
          };
        };
      };
    };
  };

  home.file.".dprint.json".source = builtins.toFile "dprint.json" (
    builtins.toJSON {
      lineWidth = 80;

      typescript = {
        quotoStyle = "preferSingle";
        binaryExpression.operatorPosition = "sameLine";
      };

      json.indentWidth = 2;

      excludes = [
        "**/*-lock.json"
      ];

      plugins = [
        "https://plugins.dprint.dev/typescript-0.93.0.wasm"
        "https://plugins.dprint.dev/json-0.19.3.wasm"
        "https://plugins.dprint.dev/markdown-0.17.8.wasm"
      ];
    }
  );
}
