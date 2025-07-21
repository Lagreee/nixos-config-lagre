{ pkgs, user, ... }: {
  # SDDM richiede X11 server anche per sessioni Wayland
  services.xserver.enable = true;
  
 # programs.uwsm.enable = true;
    
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    settings = {
      General = {
        DefaultSession = "hyprland";
      };
    };
  };

}
