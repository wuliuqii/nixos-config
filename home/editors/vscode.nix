{
  lib,
  config,
  pkgs,
  ...
}:

lib.mkIf config.optional.dev.vscode {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;

    profiles.default.userSettings = {
      "security.workspace.trust.enabled" = false;

      "editor.formatOnSave" = true;
      "editor.fontFamily" = "'${config.profile.font}'";
      "editor.fontSize" = 20;
      "editor.fontLigatures" = true;
      "editor.inlineSuggest.enabled" = true;
      "editor.lineNumbers" = "relative";

      "terminal.integrated.commandsToSkipShell" = [ "-workbench.action.quickOpen" ];
      "terminal.integrated.fontFamily" = "'${config.profile.font}'";
      "terminal.integrated.fontSize" = 20;
      "terminal.integrated.shellIntegration.enabled" = true;

      "chat.editor.fontSize" = 18;

      "window.menuBarVisibility" = "toggle";
      "window.newWindowDimensions" = "inherit";
      "window.zoomLevel" = 1;

      "workbench.colorTheme" =
        if config.profile.darkMode then "Catppuccin Macchiato" else "Catppuccin Latte";
      "workbench.iconTheme" =
        if config.profile.darkMode then "catppuccin-macchiato" else "catppuccin-latte";
      "workbench.startupEditor" = "none";
      "workbench.editorAssociations" = {
        "*.wasm" = "hexEditor.hexedit";
      };

      "git.confirmSync" = false;

      "update.mode" = "none";

      "explorer.confirmDelete" = false;
      "explorer.confirmDragAndDrop" = false;

      "nixEnvSelector.suggestion" = false;
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil";
      "nix.serverSettings" = {
        "nil" = {
          "formatting" = {
            "command" = [ "nixpkgs-fmt" ];
          };
        };
      };

      "gopls" = {
        "ui.semanticTokens" = true;
      };

      "rust-analyzer.check.command" = "clippy";
      "rust-analyzer.typing.autoClosingAngleBrackets.enable" = true;

      "zig.path" = "${pkgs.zig}/bin/zig";
      "zig.zls.path" = "${pkgs.zls}/bin/zls";

      "github.copilot.enable" = {
        "markdown" = "true";
      };

      "javascript.updateImportsOnFileMove.enabled" = "always";

      # "extensions.experimental.affinity" = {
      #   "jasew.vscode-helix-emulation" = 1;
      # };
    };
  };
}
