{...}: {
  initialHashedPassword = "$y$j9T$N77gmNuNqzfKHxdZ/.t5E.$SMCpLZojoP67.X7ngz9i.YAXFnoSSI9DbECu7wEklIA";
  users = {
    noctiere = {
      username = "noctiere";
      useremail = "potatoyear@gmail.com";
      userfullname = "Aleksey Tarakanov";
      super-user = true;
      sshAuthorizedKeys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP4HT3JvK0SE+x/gaR7v56YRnVMocPupAzXyrIrAOXPe noctiere@omen"
      ];
    };
  };
}
