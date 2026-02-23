{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.theme.stylix;
in {
  imports = [inputs.stylix.nixosModules.stylix];

  options.modules.theme = {
    stylix = {
      enable = lib.mkEnableOption "Enable Stylix";

      polarity = lib.mkOption {
        type = lib.types.str;
        default = "dark";
        description = "System color scheme polarity to use";
      };

      colorScheme = lib.mkOption {
        type = lib.types.str;
        default = "kanagawa-dragon";
        description = "System color scheme to use";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    stylix = {
      enable = true;
      polarity = cfg.polarity;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/${cfg.colorScheme}.yaml";
    };
  };
}
