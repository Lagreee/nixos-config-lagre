{ pkgs, user, config,  ... }: {
  
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
  
  services.greetd.enable = true;
  
  services.greetd.settings = {
    initial_session = {
      command = "Hyprland";
      user = "lagre";
    };
   
    default_session = {
      command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland --user-menu";
      user = "greeter";
    };
  };

  #environment.systemPackages = config.environment.systemPackages ++ [
  #  pkgs.tuigreet
  #];

  users.users.greeter = {
    isSystemUser = true;
    group = "greeter";
  };

  users.groups.greeter = {};
}
