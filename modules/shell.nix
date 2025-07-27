{
  pkgs,
  myvars,
  ...
}: {
  programs = {
    zsh.enable = true;
  };

  # users.users.${myvars.username} = {
  #   shell = pkgs.bash;
  # };

  environment.systemPackages = with pkgs; [
    ripgrep
  ];
}
