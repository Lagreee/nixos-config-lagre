{ pkgs, user, ... }: {
  programs.zsh.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;
    users.${user} = {
      isNormalUser = true;
      extraGroups = [ "wheel" "input" "networkmanager" ];
    };
  };

  # Commenta l'autologin per abilitare SDDM
  # services.getty.autologinUser = user;
}
