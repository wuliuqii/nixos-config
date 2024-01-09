{ config, ... }:
{
  users.mutableUsers = false;
  users.users.root = {
    initialHashedPassword = "$6$8/ZJ0jr/BWf4at92$PmRuEML2eiCHcRe/vuc54xgSkU.T7bO6ljUqczhkpw3kAv1mTl.PLMOhRuG.yIiEklJGwcHq3szit4PPkZaEM0";
  };
  users.users.${config.machine.userName} = {
    inherit (config.machine) hashedPassword shell;
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" ];
  };

  security = {
    sudo.wheelNeedsPassword = false;
    # allow wayland lockers to unlock the screen
    pam.services.swaylock.text = "auth include login";

    # userland niceness
    rtkit.enable = true;

    polkit = {
      enable = true;

      extraConfig = ''
        polkit.addRule(function(action, subject) {
          if (action.id == "org.freedesktop.systemd1.manage-units") {
            if (action.lookup("unit") == "v2raya.service") {
              var verb = action.lookup("verb");
              if (verb == "start" || verb == "stop" || verb == "restart") {
                return polkit.Result.YES;
              }
            }
          }
        })
      '';
    };
  };
}
