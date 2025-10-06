{
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption;
in {
  imports = [
    ./fonts.nix
    ./stylix.nix
  ];

  options.modules.styles.theme = {
    polarity = lib.mkOption {
      type = lib.types.str;
      default = "dark";
      description = "System color scheme polarity to use";
    };
    colorScheme = lib.mkOption {
      type = lib.types.str;
      default = "rose-pine";
      description = "System color scheme to use";
    };
  };
}
