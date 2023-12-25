{ ... }:
{
  programs.waybar = {
    enable = true;

    style = builtins.readFile ./style.css;

    settings = {
      mainBar = {
        layer = "top";
        modules-center = [
          "custom/padd"
          "custom/l_end"
          "hyprland/workspaces"
          "custom/r_end"
          "custom/padd"
        ];
        modules-left = [
          "custom/padd"
          "custom/l_end"
          "custom/logo"
          "custom/r_end"
          "custom/l_end"
          "clock"
          "custom/r_end"
          "custom/l_end"
          "cpu"
          "memory"
          # "temperature"
          "custom/r_end"
          "custom/l_end"
          "mpris"
          "cava"
          "custom/r_end"
          "custom/padd"
        ];
        modules-right = [
          "custom/padd"
          "custom/l_end"
          "network"
          "bluetooth"
          "custom/r_end"
          "custom/l_end"
          "pulseaudio"
          "pulseaudio#microphone"
          "backlight"
          "custom/r_end"
          "custom/l_end"
          "tray"
          "battery"
          "custom/r_end"
          "custom/l_end"
          "custom/power"
          "custom/r_end"
          "custom/padd"
        ];

        "hyprland/workspaces" = {
          disable-scroll = true;
          sort-by-name = true;
          format = "{icon}";
        };

        cpu = {
          format = " {usage}%";
        };
        memory = {
          "format" = " {}%";
        };
        temperature = {
          "format" = " {temperatureC}°C";
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "󰖁";
          on-click = "pavucontrol -t 3";
          on-scroll-up = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
          on-scroll-down = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
          tooltip-format = "{icon} {desc} // {volume}%";
          scroll-step = 5;
          format-icons = {
            default = [ "" "" "" ];
          };
        };

        "pulseaudio#microphone" = {
          format = "{format_source}";
          format-source = " {volume}%";
          format-source-muted = "";
          on-click = "pavucontrol -t 4";
          on-scroll-up = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
          on-scroll-down = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
          scroll-step = 5;
          tooltip-format = "{format_source} {source_desc} // {source_volume}%";
        };

        network = {
          format-wifi = "󰤨 {signalStrength}%";
          format-ethernet = "󱘖 Wired";
          tooltip-format = "󱘖 {ipaddr}  {bandwidthUpBytes}  {bandwidthDownBytes}";
          format-linked = "󱘖 {ifname} (No IP)";
          format-disconnected = " Disconnected";
          on-click = "nm-connection-editor";
        };

        bluetooth = {
          format = " {status}";
          format-disabled = "";
          format-connected = " {num_connections}";
          tooltip-format = "{controller_alias}\t{controller_address}";
          tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
          tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
          on-click = "blueman-manager";
        };

        backlight = {
          device = "intel_backlight";
          format = "{icon} {percent}%";
          format-icons = [ "" "" "" "" "" "" "" "" "" ];
          on-scroll-down = "brillo -q -u 300000 -A 5";
          on-scroll-up = "brillo -q -u 300000 -U 5";
          tooltip = false;
        };

        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-icons = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
          format-full = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          tooltip = false;
        };

        clock = {
          format = "{: %R}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        mpris = {
          format-playing = "▶";
          format-paused = "⏸";
          format-stopped = "";
          dynamic-priority = [ "length" "position" "album" ];
          dynamic-len = 1;
          max-length = 999;
          ignored-players = [ "firefox" ];
          tooltip = true;
          tooltip-format = "{player} ({status})\n{dynamic}";
        };

        cava = {
          framerate = 30;
          autosens = 1;
          bars = 12;
          # hide_on_silence = true;
          sleep_timer = 1;
          method = "pipewire";
          source = "auto";
          stereo = true;
          reverse = false;
          bar_delimiter = 0;
          monstercat = false;
          waves = false;
          noise_reduction = 0.77;
          input_delay = 0.1;
          format-icons = [ "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
          actions = {
            on-click-right = "mode";
          };
        };

        tray = {
          icon-size = 16;
          spacing = 5;
        };

        "custom/power" = {
          tooltip = false;
          on-click = "wlogout -p layer-shell";
          format = "";
        };

        "custom/logo" = {
          format = " ";
          tooltip = false;
        };

        #  modules for padding //
        "custom/l_end" = {
          format = " ";
          interval = "once";
          tooltip = false;
        };
        "custom/r_end" = {
          format = " ";
          interval = "once";
          tooltip = false;
        };
        "custom/sl_end" = {
          format = " ";
          interval = "once";
          tooltip = false;
        };
        "custom/sr_end" = {
          format = " ";
          interval = "once";
          tooltip = false;
        };
        "custom/rl_end" = {
          format = " ";
          interval = "once";
          tooltip = false;
        };
        "custom/rr_end" = {
          format = " ";
          interval = "once";
          tooltip = false;
        };
        "custom/padd" = {
          format = "  ";
          interval = "once";
          tooltip = false;
        };
      };
    };
  };
}

