''
  #main-window[tabsintitlebar="true"]:not([extradragspace="true"])
    #TabsToolbar > .toolbar-items {
      opacity: 0;
      pointer-events: none;
    }

    #main-window:not([tabsintitlebar="true"]) #TabsToolbar {
      visibility: collapse !important;
    }

    #sidebar-box[sidebarcommand="treestyletab_piro_sakura_ne_jp-sidebar-action"] #sidebar-header {
      display: none;
    }

    #titlebar {
      visibility: collapse !important;
    }

    #urlbar {
      font-family: JetBrainsMono Nerd Font Mono !important;
      font-size: 12pt !important;
    }

    #TabsToolbar > * {
      visibility: collapse;
    }
''
