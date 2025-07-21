{ 
  pkgs, 
  user, 
  config, 
  ... 
}:  let
  tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet";
  hyprland-session = "${pkgs.hyprland}/share/wayland-sessions";
in {
  # ----- Configurazione Greetd + tuigreet ----------

  services.greetd = {
    enable = true;
    settings = {

      initial_session = {
        command = "Hyprland";
        user = "lagre";
      };

      default_session = {
        command = "${tuigreet} --time --greeting 'Synchronization ratio: 100% - Welcome back' --theme border=red;text=white;prompt=red;time=yellow;action=green;button=bright_yellow;container=black;input=red --remember --remember-session --sessions ${hyprland-session}";
        user = "greeter";
      };
    };
  };

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

}
