{ pkgs
, inputs
, ...
}:
{
  programs.vscode = {
    enable = true;
    # lock vscode to 1.81.1 because native titlebar causes vscode to crash
    # TODO: https://github.com/microsoft/vscode/issues/184124#issuecomment-1717959995
    package =
      (import inputs.nixpkgs-vscode {
        system = pkgs.system;
        config.allowUnfree = true;
      }).vscode;

    userSettings = {
      "security.workspace.trust.enabled" = false;

      "editor.formatOnSave" = true;
      "editor.fontFamily" = "'JetBrainsMono Nerd Font'";
      "editor.fontSize" = 16;
      "editor.fontLigatures" = false;
      "editor.inlineSuggest.enabled" = true;
      "editor.lineHeight" = 22;
      "editor.lineNumbers" = "relative";

      "terminal.integrated.commandsToSkipShell" = [ "-workbench.action.quickOpen" ];
      "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Font'";
      "terminal.integrated.fontWeight" = "normal";
      "terminal.integrated.fontSize" = 16;
      "terminal.integrated.fontWeightBold" = 600;
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
    };
  };
}
