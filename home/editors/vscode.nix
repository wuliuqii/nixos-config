{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;

    userSettings = {
      "security.workspace.trust.enabled" = false;

      "editor.formatOnSave" = true;
      "editor.fontFamily" = "'JetBrainsMono Nerd Font'";
      "editor.fontSize" = 16;
      "editor.fontLigatures" = true;
      "editor.inlineSuggest.enabled" = true;
      "editor.lineNumbers" = "relative";

      "terminal.integrated.commandsToSkipShell" = [ "-workbench.action.quickOpen" ];
      "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Font'";
      "terminal.integrated.fontSize" = 16;
      "terminal.integrated.shellIntegration.enabled" = true;

      "window.menuBarVisibility" = "toggle";
      "window.newWindowDimensions" = "inherit";
      "window.zoomLevel" = 1;

      "workbench.colorTheme" = "Catppuccin Macchiato";
      "workbench.iconTheme" = "catppuccin-macchiato";
      "workbench.startupEditor" = "none";

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
            "command" = [
              "nixpkgs-fmt"
            ];
          };
        };
      };

      "gopls" = {
        "ui.semanticTokens" = true;
      };

      "rust-analyzer.check.command" = "clippy";
      "rust-analyzer.typing.autoClosingAngleBrackets.enable" = true;

      "github.copilot.enable" = {
        "markdown" = "true";
      };

      "javascript.updateImportsOnFileMove.enabled" = "always";

      "extensions.experimental.affinity" = {
        "jasew.vscode-helix-emulation" = 1;
      };
    };
  };
}
