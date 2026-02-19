{
  config,
  osConfig,
  lib,
  pkgs,
  ...
}: let
  osCfg = osConfig.modules.gui.wm.hypr;
in {
  config = lib.mkIf osCfg.enable {
    hmModules.gui.launchers.walker.enable = true;

    home.file.".config/hypr".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/hypr";

    wayland.windowManager.hyprland = {
      enable = true;
      # set the Hyprland and XDPH packages to null to use the ones from the NixOS module
      package = null;
      portalPackage = null;
      systemd.variables = ["--all"];
      systemd.enable = false;
    };

    programs.hyprlock.enable = true;
    home.packages = with pkgs; [
      imagemagick
    ];

    services.hyprpaper.enable = true;

    stylix.targets = {
      hyprland.enable = false;
      hyprlock.enable = false;
      hyprpaper.enable = false;
    };
  };
}
