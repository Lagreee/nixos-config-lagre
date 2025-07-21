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
      default_session = {
        command = "${tuigreet} --time --greeting 'Synchronization ratio: 100% - Welcome back' --theme border=bright_red;text=bright_white;time=bright_cyan;container=black;title=bright_red;greet=bright_white;prompt=bright_red;input=bright_red;action=bright_magenta;button=bright_white --remember --remember-session --sessions ${hyprland-session}";
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
