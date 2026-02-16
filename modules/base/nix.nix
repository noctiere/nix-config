{
  config,
  lib,
  ...
}: let
  # Filter the attribute set to only include users with super-user = true
  trustedUserAttrs = lib.filterAttrs (name: user: user.super-user) config.modules.users;

  # Extract just the 'username' string from those filtered users into a list
  trustedUserList = lib.mapAttrsToList (name: user: user.username) trustedUserAttrs;
in {
  # To install nvidia hardware drivers, you need to enable unfree packages
  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    # enable flakes globally
    experimental-features = [
      "nix-command"
      "flakes"
    ];

    trusted-users = ["root"] ++ trustedUserList;
    substituters = [
      "https://cache.nixos.org"
      "https://nix-community.cachix.org"
      # "https://hyprland.cachix.org"
    ];
    # trusted-substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      # "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };
}
