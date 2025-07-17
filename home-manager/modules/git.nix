{
  programs.git = {
    enable = true;
    userName = "Lagreee";
    userEmail = "lagreca.gabriele@gmail.com";

    extraConfig = {
       url."git@github.com".insteadOf = "https://github.com";
       push.default = "simple";
       init.defaultBranch = "main";
       pull.rebase = false;
    };
  };
}
