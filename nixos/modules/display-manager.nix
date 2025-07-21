{ pkgs, user, config,  ... }:  let
  tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet";
  hyprland-session = "${pkgs.hyprland}/share/wayland-sessions";
in{
  
  # ----- Configurazione SDDM -----   

  # SDDM richiede X11 server anche per sessioni Wayland
  #services.xserver.enable = true;
      
  #services.displayManager.sddm = {
  #  enable = true;
  #  wayland.enable = true;
  #  settings = {
  #    General = {
  #      DefaultSession = "hyprland";
  #    };
  #  };
  #};
  # ------------------------------


  # ----- Configurazione Greetd + tuigreet ----------
  
  #services.greetd.enable = true;
  
  #services.greetd.settings = {
  #  initial_session = {
  #    command = "Hyprland";
  #    user = "lagre";
  #  };
  # 
  #  default_session = {
  #    command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland --user-menu";
  #    user = "greeter";
  #  };
  #};

  #environment.systemPackages = config.environment.systemPackages ++ [
  #  pkgs.tuigreet
  #];

  #users.users.greeter = {
  #  isSystemUser = true;
  #  group = "greeter";
  #};

  #users.groups.greeter = {};
  # ------------------------------

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${tuigreet} --time --remember --remember-session --sessions ${hyprland-session}";
        user = "greeter";
      };
    };
  };

  # this is a life saver.
  # literally no documentation about this anywhere.
  # might be good to write about this...
  # https://www.reddit.com/r/NixOS/comments/u0cdpi/tuigreet_with_xmonad_how/
  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal"; # Without this errors will spam on screen
    # Without these bootlogs will spam on screen
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };
}
