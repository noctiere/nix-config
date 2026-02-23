{
  config,
  osConfig,
  lib,
  ...
}: let
  osCfg = osConfig.modules.gui.wm.hypr;
in {
  config = lib.mkIf osCfg.enable {
    home.file.".config/hypr".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/hypr";

    wayland.windowManager.hyprland = {
      enable = true;
      # set the Hyprland and XDPH packages to null to use the ones from the NixOS module
      package = null;
      portalPackage = null;
      systemd.variables = ["--all"];
      systemd.enable = false;
    };

    services.hyprpaper.enable = true;

    stylix.targets = {
      hyprland.enable = false;
      hyprpaper.enable = false;
    };
  };
}
