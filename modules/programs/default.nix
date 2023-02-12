#
#  Apps
#
#  flake.nix
#   ├─ ./hosts
#   │   └─ home.nix
#   └─ ./modules
#       └─ ./apps
#           └─ default.nix *
#               └─ ...
#

[
   ./alacritty.nix
   ./rofi
   ./rust.nix
   ./go.nix
]
# Waybar.nix is pulled from modules/desktop/..
# Games.nix is pulled from desktop/default.nix
