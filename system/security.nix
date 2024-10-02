{ config, ... }:
{
  users.mutableUsers = false;
  users.users.root = {
    initialHashedPassword = "$6$8/ZJ0jr/BWf4at92$PmRuEML2eiCHcRe/vuc54xgSkU.T7bO6ljUqczhkpw3kAv1mTl.PLMOhRuG.yIiEklJGwcHq3szit4PPkZaEM0";
  };
  users.users.${config.profile.userName} = {
    inherit (config.profile) hashedPassword shell;
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "video"
      "audio"
    ];
  };

  security = {
    sudo.wheelNeedsPassword = false;
    # allow wayland lockers to unlock the screen
    pam.services = {
      hyprlock.text = "auth include login";
      greetd.enableGnomeKeyring = true;
    };

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
        });


        polkit.addRule(function(action, subject) {
          if (action.id.indexOf("org.freedesktop.NetworkManager.") == 0 && subject.isInGroup("network")) {
            return polkit.Result.YES;
          }
        });
      '';
    };
  };
}
