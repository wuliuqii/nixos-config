{ pkgs
, ...
}:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode-fhs;

    keybindings = [
      {
        command = "-rust-analyzer.onEnter";
        key = "enter";
        when =
          "editorTextFocus && !suggestWidgetVisible && editorLangId == 'rust'";
      }
    ];
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

      "workbench.colorTheme" = "Nord";
      "workbench.iconTheme" = "eq-material-theme-icons";

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

      "Codegeex.Privacy" = true;
    };
  };
}
