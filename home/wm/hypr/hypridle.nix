{
  pkgs,
  lib,
  config,
  ...
}:
let
  suspendScript = pkgs.writeShellScript "suspend-script" ''
    ${pkgs.pipewire}/bin/pw-cli i all 2>&1 | ${pkgs.ripgrep}/bin/rg running -q
    # only suspend if audio isn't running
    if [ $? == 1 ]; then
      ${pkgs.systemd}/bin/systemctl suspend
    fi
  '';
in

lib.mkIf config.optional.hypr.enable {
  # screen idle
  services.hypridle = {
    enable = true;
    settings = {
      beforeSleepCmd = "${pkgs.systemd}/bin/loginctl lock-session";
      lockCmd = lib.getExe config.programs.hyprlock.package;

      # listeners = [
      #   {
      #     timeout = 330;
      #     onTimeout = suspendScript.outPath;
      #   }
      # ];
    };
  };
}
