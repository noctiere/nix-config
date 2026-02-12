{myvars, ...}: {
  programs.git = {
    enable = true;
    settings = {
        user = {
        name = "noctiere";
        email = "potatoyear@gmail.com";
      };
      init.defaultBranch = "main";
    };
  };
}
