{
  config,
  lib,
  ...
}: let
  cfg = config.profiles.desktop;
in {
  options.profiles.desktop.enable = lib.mkEnableOption "Enable desktop profile with custom system modules";

  config = lib.mkIf cfg.enable {
    # Enabling custom system modules
    modules = {
      desktop = {
        peripherals = {
          audio.enable = true;
          bluetooth.enable = true;
          # printing.enable = true;
          monitors.enable = true;
        };
        gaming.enable = true;
        security.enable = true;
      };
      gui = {
        wm = {
          # niri.enable = true;
          # mangowc.enable = true; # with tuigreet
          hypr.enable = true; # with tuigreet
          # gnome.enable = true;
          # cosmic.enable = true;
          # plasma.enable = true;
        };
      };
      theme = {
        fonts = {
          enable = true;
          # extraFontsPkgs = with pkgs; [];
        };
        stylix = {
          enable = true;
          polarity = "dark";
          colorScheme = "kanagawa-dragon";
        };
      };
      home-manager.enable = true;
      nh = {
        enable = true;
        numOfGens = "5";
        timeRange = "3d";
      };
    };
  };
}
