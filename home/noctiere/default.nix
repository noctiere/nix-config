{
  pkgs,
  myvars,
  ...
}: {
  imports = [
    ./desktop
    ./spicetify.nix
    ./helix.nix
    # ./nvim.nix
    ./stylix.nix
    ./git.nix
    ./wezterm.nix
    ./shell.nix
    ./helix.nix
  ];

  programs.home-manager.enable = true;

  home = {
    username = myvars.username;
    homeDirectory = "/home/${myvars.username}";
    packages = with pkgs; [
      fastfetch
      cowsay
      tree
      btop
      gimp3
    ];
    stateVersion = myvars.stateVersion;
  };
}
