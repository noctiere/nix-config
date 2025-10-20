{lib, ...}: let
  inherit (lib) mkOption;
in {
  imports = [
    ./fonts.nix
    ./stylix.nix
  ];

  options.modules.styles.theme = {
    polarity = mkOption {
      type = lib.types.str;
      default = "dark";
      description = "System color scheme polarity to use";
    };
    colorScheme = mkOption {
      type = lib.types.str;
      default = "rose-pine";
      description = "System color scheme to use";
    };
  };
}
