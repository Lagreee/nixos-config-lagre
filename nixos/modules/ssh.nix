{ user, pkgs, ... }: {
   # Abilita il servizio SSH per connesioni in entrata (opzionale)
   services.openssh = {
      enable = false;
      settings = {
         PasswordAuthentication = false;
	 PermitRootLogin = "no";
      };
   };

   environment.systemPackages = with pkgs; [
      openssh
   ];

   # Assicurati che la directory SSH esista con i permessi corretti
   system.activationScripts.sshSetup = ''
      mkdir -p /home/${user}/.ssh
      chmod 700 /home/${user}/.ssh
      chown ${user}:users /home/${user}/.ssh
   '';

  programs.ssh.startAgent = true;
}
