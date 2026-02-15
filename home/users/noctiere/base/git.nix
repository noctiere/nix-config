{
  programs.git = {
    settings = {
      user = {
        name = "noctiere";
        email = "potatoyear@gmail.com";
      };
      # replace https with ssh
      url = {
        "ssh://git@github.com/noctiere" = {
          insteadOf = "https://github.com/noctiere";
        };
      };
    };
  };
}
