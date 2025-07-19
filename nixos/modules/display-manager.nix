{ pkgs, user, ... }: {
  # SDDM richiede X11 server anche per sessioni Wayland
  services.xserver.enable = true;
  
  # Aggiungi UWSM ai pacchetti di sistema
  environment.systemPackages = with pkgs; [
    uwsm
  ];
  
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    settings = {
      General = {
        DefaultSession = "hyprland-uwsm";
      };
    };
  };

  # Crea una sessione personalizzata per Hyprland con UWSM
  services.xserver.displayManager.sessionPackages = [
    (pkgs.writeTextFile {
      name = "hyprland-uwsm-session";
      destination = "/share/wayland-sessions/hyprland-uwsm.desktop";
      text = ''
        [Desktop Entry]
        Name=Hyprland (UWSM)
        Comment=Hyprland with Universal Wayland Session Manager
        Exec=uwsm start hyprland
        Type=Application
      '';
     
      passthru.providedSessions = [ "hyprland-uwsm" ];
    })
  ];
}
