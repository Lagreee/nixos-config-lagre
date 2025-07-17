{
   programs.ssh = {
      enable = true;
 
      # Configurazione avanzata del client
      extraConfig = ''
	 # Github configuration
	 Host github.com
	    HostName github.com
	    User git
	    IdentityFile ~/.ssh/github_ed25519
	    IdentitiesOnly yes

	 # Alternative GitHub hostname (useful for multiple accounts)
	 Host github-personal
	    HostName github.com
	    User git
            IdentityFile ~/.ssh/github_personal_ed25519
	    IdentitiesOnly yes

	 # Default settings for all hosts
	 Host *
	    AddKeysToAgent yes
	    ForwardAgent no
	    ServerAliveInterval 60
            ServerAliveCountMax 3
      '';
      
      # Host specifici (esempio per server personali)
      matchBlocks = {
	 "personal-server" = {
	    hostname = "192.168.1.100";
	    user = "lagre";
	    identityFile = "~/.ssh/personal_server_ed25519";
	    port = 22;
	 };
      };
   };

   # Servizi per gestire l'SSH agent
   services.ssh-agent = {
      enable = true;
   };
}
