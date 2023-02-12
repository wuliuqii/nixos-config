#
# Bar
#

{ config, lib, pkgs, host, ...}:

{
  environment.systemPackages = with pkgs; [
    waybar
  ];

  nixpkgs.overlays = [                                      # Waybar needs to be compiled with the experimental flag for wlr/workspaces to work
    (self: super: {
      waybar = super.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
        patchPhase = ''
          substituteInPlace src/modules/wlr/workspace_manager.cpp --replace "zext_workspace_handle_v1_activate(workspace_handle_);" "const std::string command = \"hyprctl dispatch workspace \" + name_; system(command.c_str());"
        '';
      });
    })
  ];

  home-manager.users.gallon = {                           # Home-manager waybar config
    programs.waybar = {
      enable = true;
      systemd ={
        enable = true;
        target = "sway-session.target";                     # Needed for waybar to start automatically
      };

      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          modules-left = [  "wlr/workspaces" ];
          modules-center = [ "clock" ];
          modules-right = [ 
            "pulseaudio"
            "memory"
            "cpu"
            "network" 
            "tray"
            "custom/power"
          ];

          "wlr/workspaces" = {
            disable-scroll = true;
            sort-by-name = true;
            format = " {icon} ";
            format-icons = {default = "";};
          };

          "custom/power" = {
            tooltip = false;
            on-click = "powermenu";
            format = "襤";
          };

          pulseaudio = {
            format = " {icon} {volume}% ";
            format-muted = "ﱝ";
            format-icons = ["奄" "奔" "墳"];
          };

          network = {
            interval = 1;
            format-wifi = "";
            format-disconnected = "睊";
            format-ethernet = " ↑{bandwidthUpBytes} ↓{bandwidthDownBytes}";
            tooltip = true;
          };

          clock = {
            interval = 60;
            tooltip-format = ''
              <big>{:%Y %B}</big>
              <tt><small>{calendar}</small></tt>'';
            format = "{:%H:%M}";
          };

          memory = {
            format = " {percentage}%";
            max-length = 10;
          };

          cpu = {
            interval = 1;
            format = " {usage}%";
            max-length = 10;
          };

          tray = {
            icon-size = 21;
            spacing = 10;
          };
        };
      };
    };
    
    xdg.configFile."waybar/style.css".text = builtins.readFile ./style.css;
    xdg.configFile."waybar/macchiato.css".text = builtins.readFile ./macchiato.css;
  };
}
