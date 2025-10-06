{
  pkgs,
  myvars,
  ...
}: {
  imports = [
    ./desktop
    ./home.nix
    ./spicetify.nix
    ./helix.nix
    # ./nvim.nix
    ./stylix.nix
    ./git.nix
    ./wezterm.nix
    ./shell.nix
    ./helix.nix
  ];
}
