{myvars, ...}: {
  programs.git = {
    enable = true;
    userName = myvars.username;
    userEmail = myvars.useremail;
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
