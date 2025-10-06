{
  myvars,
  pkgs,
  ...
}: {
  programs.home-manager.enable = true;
  
  home = {
    inherit (myvars) username;
    homeDirectory = "/home/${myvars.username}";
    packages = with pkgs; [
      fastfetch
      cowsay
      tree
      btop
      gimp3
    ];
    stateVersion = "24.11";
  };
}