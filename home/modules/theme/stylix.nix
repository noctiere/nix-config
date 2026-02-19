{
  config,
  osConfig,
  lib,
  pkgs,
  ...
}: let
  osCfg = osConfig.modules.theme.stylix;
  cfg = config.hmModules.theme.stylix;
in {
  options.hmModules.theme.stylix = {
    enable = lib.mkEnableOption "Whether to enable Stylix home-manager module";
    colorScheme = lib.mkOption {
      type = lib.types.str;
      default = "kanagawa-dragon";
      description = "home-manager user's color scheme for Stylix";
    };
    image = lib.mkOption {
      type = lib.types.path;
      default = "/home/${config.home.user}/Wallpapers/default.jpg";
      description = "Path to wallpapers";
    };
  };

  config = lib.mkIf (osCfg.enable && cfg.enable) {
    stylix = {
      enable = true;
      inherit (osCfg) polarity;
      inherit (cfg) image;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/${cfg.colorScheme}.yaml";

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
