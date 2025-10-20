{myvars, ...}: {
  programs.git = {
    enable = true;
    settings = {
        user = {
        name = myvars.username;
        email = myvars.useremail;
      };
      init.defaultBranch = "main";
    };
  };
}
