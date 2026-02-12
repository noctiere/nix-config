{
  config,
  osConfig,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkOption mkIf types;
  osCfg = osConfig.modules.styles.theme;
  cfg = config.hmModules.stylix;
in {
  options.hmModules.stylix = {
    enable = mkEnableOption "Whether to enable Stylix home-manager module";
    image = mkOption {
      type = types.path;
      default = ./wallpapers/default.jpg;
      description = "Path to wallpapers";
    };
  };

  config = mkIf (osCfg.stylix.enable && cfg.enable) {
    stylix = {
      enable = true;
      inherit (osCfg) polarity;
      inherit (cfg) image;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/${osCfg.colorScheme}.yaml";

      cursor = {
        name = "Bibata-Modern-Classic";
        package = pkgs.bibata-cursors;
        size = 18;
      };

      icons = {
        enable = true;

        # Rose Pine
        # package = pkgs.rose-pine-icon-theme;
        # light = "rose-pine-dawn";
        # dark = "rose-pine";

        # # Everforest
        package = pkgs.papirus-icon-theme;
        light = "Papirus-Light";
        dark = "Papirus-Dark";

        # Gruvbox
        # package = pkgs.gruvbox-plus-icons;
        # light = "Gruvbox-Plus-Light";
        # dark = "Gruvbox-Plus-Dark";
      };

      targets = {
        waybar.enable = false;
        spicetify.enable = false;
        wezterm.enable = false;
      };
    };
  };
}
