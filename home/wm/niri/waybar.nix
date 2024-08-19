{
  config,
  lib,
  pkgs,
  ...
}:
let
  icons = rec {
    calendar = "󰃭 ";
    clock = " ";
    battery.charging = "󱐋";
    battery.horizontal = [
      " "
      " "
      " "
      " "
      " "
    ];
    battery.vertical = [
      "󰁺"
      "󰁻"
      "󰁼"
      "󰁽"
      "󰁾"
      "󰁿"
      "󰂀"
      "󰂁"
      "󰂂"
      "󰁹"
    ];
    battery.levels = battery.vertical;
    network.disconnected = "󰤮 ";
    network.ethernet = "󰈀 ";
    network.strength = [
      "󰤟 "
      "󰤢 "
      "󰤥 "
      "󰤨 "
    ];
    bluetooth.on = "󰂯";
    bluetooth.off = "󰂲";
    bluetooth.battery = "󰥉";
    volume.source = "󱄠";
    volume.muted = "󰝟";
    volume.levels = [
      "󰕿"
      "󰖀"
      "󰕾"
    ];
    idle.on = "󰈈 ";
    idle.off = "󰈉 ";

    notification.red_badge = "<span foreground='red'><sup></sup></span>";
    notification.bell = "󰂚";
    notification.bell-badge = "󱅫";
    notification.bell-outline = "󰂜";
    notification.bell-outline-badge = "󰅸";
  };
in

lib.mkIf config.optional.niri {
  programs.waybar = {
    enable = true;
    catppuccin.enable = true;
    catppuccin.mode = "prependImport";
    systemd.enable = true;
    settings.mainBar = {
      layer = "top";
      modules-left = [
        "wireplumber"
        "wireplumber#source"
      ];
      modules-center = [
        "clock#date"
        "clock"
      ];
      modules-right = [
        "network"
        "bluetooth"
        "bluetooth#battery"
        "battery"
        "custom/swaync"
      ];

      battery = {
        interval = 5;
        format = "{icon}  {capacity}%";
        format-charging = "{icon}  {capacity}% ${icons.battery.charging}";
        format-icons = icons.battery.levels;
        states.warning = 30;
        states.critical = 15;
      };

      clock = {
        interval = 1;
        format = "${icons.clock} {:%H:%M:%S} paggles";
      };

      "clock#date" = {
        format = "${icons.calendar} {:%Y-%m-%d}";
      };

      network = {
        tooltip-format = "{ifname}";
        format-disconnected = icons.network.disconnected;
        format-ethernet = icons.network.ethernet;
        format-wifi = "{icon} {essid}";
        format-icons = icons.network.strength;
      };

      bluetooth = {
        format = "{icon}";
        format-disabled = "";
        format-icons = {
          inherit (icons.bluetooth) on off;
          connected = icons.bluetooth.on;
        };
        format-connected = "{icon} {device_alias}";
      };
      "bluetooth#battery" = {
        format = "";
        format-connected-battery = "${icons.bluetooth.battery} {device_battery_percentage}%";
      };

      wireplumber = {
        format = "{icon} {volume}%";
        format-muted = "${icons.volume.muted} {volume}%";
        format-icons = icons.volume.levels;
        reverse-scrolling = 1;
        tooltip = false;
      };

      "wireplumber#source" = {
        format = "${icons.volume.source} {node_name}";
        tooltip = false;
      };

      # "group/volume" = {
      #   orientation = "horizontal";
      #   modules = [
      #     "wireplumber"
      #     "wireplumber#source"
      #   ];
      #   drawer = {
      #     transition-left-to-right = true;
      #   };
      # };

      idle_inhibitor = {
        format = "{icon}";
        format-icons = {
          activated = icons.idle.on;
          deactivated = icons.idle.off;
        };
      };

      "custom/swaync" = {
        tooltip = false;
        format = "{icon}";
        format-icons = {
          notification = "<span foreground='red'><sup></sup></span>";
          none = icons.notification.bell-outline;
          none-cc-open = icons.notification.bell;
          dnd-notification = "<span foreground='red'><sup></sup></span>";
          dnd-none = "";
          inhibited-notification = "<span foreground='red'><sup></sup></span>";
          inhibited-none = "";
          dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
          dnd-inhibited-none = "";
        };
        return-type = "json";
        exec-if = "which swaync-client";
        exec = "swaync-client -swb";
        on-click = "swaync-client -t -sw";
        on-click-right = "swaync-client -d -sw";
        escape = true;
      };
    };

    style =
      let
        modules = s: "${s ".modules-left"}, ${s ".modules-center"}, ${s ".modules-right"}";
        module = s: modules (m: "${m} > ${s} > *");
      in
      ''
                * {
                    border: none;
                    font-family: JetBrainsMono Nerd Font;
                    font-size: 16px;
                    color: @text;
                }

                window#waybar {
            background: transparent;
            background-color: @background;
            color: @foreground;
            transition-property: background-color;
            transition-duration: 0.1s;
        }

        #window {
            margin: 2;
            padding-left: 8;
            padding-right: 8;
        }

        button {
            box-shadow: inset 0 -3px transparent;
            border: none;
            border-radius: 0;
        }

        button:hover {
            background: inherit;
            border-top: 2px solid @hover;
        }

        #workspaces button {
            padding: 0 4px;
        }

        #workspaces button.focused {
            background-color: rgba(0, 0, 0, 0.3);
            color: @blue;
            border-top: 2px solid @blue;
        }

        #workspaces button.urgent {
            background-color: #eb4d4b;
        }

        #pulseaudio,
        #clock,
        #battery,
        #cpu,
        #memory,
        #disk,
        #temperature,
        #backlight,
        #wireplumber,
        #tray,
        #mode,
        #scratchpad {
            margin: 2px;
            padding-left: 4px;
            padding-right: 4px;
        }

        #clock {
            color: @maroon;
            border-bottom: 2px solid @maroon;
        }

        #clock.date {
            color: @mauve;
            border-bottom: 2px solid @mauve;
        }

        #pulseaudio {
            color: @blue;
            border-bottom: 2px solid @blue;
        }

        #network {
            color: @yellow;
            border-bottom: 2px solid @yellow;
        }

        #idle_inhibitor {
            margin-right: 12px;
            color: #7cb342;
        }

        #idle_inhibitor.activated {
            color: @red;
        }

        #battery.charging,
        #battery.plugged {
            color: @green;
            border-bottom: 2px solid @green;
        }

        /* If workspaces is the leftmost module, omit left margin */
        .modules-left>widget:first-child>#workspaces {
            margin-left: 0;
        }

        /* If workspaces is the rightmost module, omit right margin */
        .modules-right>widget:last-child>#workspaces {
            margin-right: 0;
        }
      '';
  };
}
