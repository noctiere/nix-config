{
  config,
  osConfig,
  lib,
  ...
}: let
  osCfg = osConfig.modules.desktop.wm.hypr;
  cfg = config.hmModules.desktop.wm.hypr;
in {
  options.hmModules.desktop.wm.hypr.enable = lib.mkEnableOption "Whether to enable hyprland home-manager module";

  config = lib.mkIf (osCfg.enable && cfg.enable) {
    home.file.".config/hypr".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/hypr";
    stylix.targets = {
      hyprland = {
        enable = false;
        colors.enable = false;
        hyprpaper.enable = false;
        image.enable = false;
      };
      hyprlock.enable = false;
      hyprpanel.enable = false;
      hyprpaper.enable = false;
    };

    wayland.windowManager.hyprland = {
      enable = true;
      # set the Hyprland and XDPH packages to null to use the ones from the NixOS module
      package = null;
      portalPackage = null;
      systemd.variables = ["--all"];
      systemd.enable = false;
    };

    programs.hyprlock.enable = true;
  };
}
