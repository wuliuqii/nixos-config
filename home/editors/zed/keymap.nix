[
  # Global
  {
    "context" = "Workspace";
    "bindings" = {
      "ctrl-b" = "workspace::ToggleBottomDock";
    };
  }
  # File panel (netrw)
  {
    "context" = "ProjectPanel && not_editing";
    "bindings" = {
      "z" = "outline_panel::CollapseAllEntries";
      "a" = "project_panel::NewFile";
      "d" = "project_panel::Delete";
      "r" = "project_panel::Rename";
      "x" = "project_panel::Cut";
      "y" = "project_panel::Copy";
      "p" = "project_panel::Paste";
      # Close
      "q" = "workspace::ToggleLeftDock";
    };
  }
  # Surround. Select word and press shift-s and add the surround
  {
    "context" = "vim_mode == visual";
    "bindings" = {
      "shift-s" = [
        "vim::PushOperator"
        {
          "AddSurrounds" = {};
        }
      ];
    };
  }
  # Terminal
  {
    "context" = "Terminal";
    "bindings" = {
      "ctrl-n" = "workspace::NewTerminal";
      "ctrl-l" = "terminal::Clear";
      "ctrl-s" = ["terminal::SendKeystroke" "ctrl-s"];
    };
  }
  # Visual or normal mode
  {
    "context" = "Editor && VimControl && !VimWaiting && !menu";
    "bindings" = {
      # Git
      "space g b" = "editor::ToggleGitBlame";
      # Toggle inlay hints
      "space t i" = "editor::ToggleInlayHints";
      # Toggle indent guides
      "space i g" = "editor::ToggleIndentGuides";
      # Toggle soft wrap
      "space u w" = "editor::ToggleSoftWrap";
      # Toggle Zen mode
      "space c z" = "workspace::ToggleCenteredLayout";
      # Open markdown preview
      "space m p" = "markdown::OpenPreviewToTheSide";
      # Search word
      "n" = "search::SelectNextMatch";
      "shift-n" = "search::SelectPrevMatch";
      # Go to file with `gf`
      "space g f" = "editor::OpenExcerpts";
    };
  }
  # Normal mode
  {
    "context" = "Editor && vim_mode == normal && !VimWaiting && !menu";
    "bindings" = {
      # Open recent project
      "space p p" = "projects::OpenRecent";
      # Close active panel
      "space q" = "pane::CloseActiveItem";
      "space f f" = ["file_finder::Toggle" { "separate_history" = true; }];
      # Move between panes
      # "ctrl-h" = ["workspace::ActivatePaneInDirection", "Left"];
      # "ctrl-l" = ["workspace::ActivatePaneInDirection", "Right"];
      # "ctrl-k" = ["workspace::ActivatePaneInDirection", "Up"];
      # "ctrl-j" = ["workspace::ActivatePaneInDirection", "Down"];
      # LSP
      "space g a" = "editor::ToggleCodeActions";
      "space r n" = "editor::Rename";
      "g d" = "editor::GoToDefinition";
      "g D" = "editor::GoToDefinitionSplit";
      "g i" = "editor::GoToImplementation";
      "g I" = "editor::GoToImplementationSplit";
      "g t" = "editor::GoToTypeDefinition";
      "g T" = "editor::GoToTypeDefinitionSplit";
      "g r" = "editor::FindAllReferences";
      "space k" = "editor::Hover";
      "ctrl-f" = "editor::Format";
      # Switch between buffers
      "ctrl-h" = "pane::ActivatePrevItem";
      "ctrl-l" = "pane::ActivateNextItem";
      # Save file
      "ctrl-s" = "workspace::Save";
      "space w" = "workspace::Save";
      # Show project panel with current file
      "space e" = "pane::RevealInProjectPanel";
      # Split panes
      "s v" = "pane::SplitRight";
      "s s" = "pane::SplitDown";
      # Open lazygit
      "space g g" = ["task::Spawn" { "task_name" = "GitUI"; }];
    };
  }
  # Empty pane, set of keybindings that are available when there is no active editor
  {
    "context" = "EmptyPane || SharedScreen";
    "bindings" = {
      # Open recent project
      "space p p" = "projects::OpenRecent";
    };
  }
  # Better escape
  {
    "context" = "Editor && vim_mode == insert && !menu";
    "bindings" = {
      "j j" = "vim::NormalBefore"; # remap jj in insert mode to escape
      "j k" = "vim::NormalBefore"; # remap jk in insert mode to escape
    };
  }
  # Panel nagivation
  {
    "context" = "Dock";
    "bindings" = {
      "ctrl-w h" = ["workspace::ActivatePaneInDirection" "Left"];
      "ctrl-w l" = ["workspace::ActivatePaneInDirection" "Right"];
      "ctrl-w k" = ["workspace::ActivatePaneInDirection" "Up"];
      "ctrl-w j" = ["workspace::ActivatePaneInDirection" "Down"];
    };
  }
]
