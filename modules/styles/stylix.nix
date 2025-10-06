{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.modules.styles.theme;
in {
  imports = [inputs.stylix.nixosModules.stylix];

  options.modules.styles.theme.stylix.enable = mkEnableOption "Enable Stylix";

  config = mkIf cfg.stylix.enable {
    stylix = {
      enable = true;
      polarity = cfg.polarity;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/${cfg.colorScheme}.yaml";
      # base16Scheme = "${pkgs.base16-schemes}/share/themes/kanagawa.yaml";
      # base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
      # base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest-dark-hard.yaml";
      # base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    };
  };
}
