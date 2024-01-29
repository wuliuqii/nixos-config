{ pkgs, ... }:
let
  suspendScript = pkgs.writeShellScript "suspend-script" ''
    ${pkgs.pipewire}/bin/pw-cli i all | ${pkgs.ripgrep}/bin/rg running
    # only suspend if audio isn't running
    if [ $? == 1 ]; then
      ${pkgs.systemd}/bin/systemctl suspend
    fi
  '';
in
{
  # screen idle
  services.swayidle = {
    enable = true;
    events = [
      {
        event = "before-sleep";
        command = "${pkgs.systemd}/bin/loginctl lock-session";
      }
      {
        event = "lock";
        command = "${pkgs.swaylock-effects}/bin/swaylock";
      }
      {
        # after sleep, v2raya will be not working,
        # so we need to restart it
        event = "after-resume";
        command = "${pkgs.systemd}/bin/systemctl restart v2raya.service";
      }
    ];
    timeouts = [
      {
        timeout = 600;
        command = suspendScript.outPath;
      }
    ];
  };
}
