{
  osConfig,
  pkgs,
  lib,
  ...
}: let
  cfg = osConfig.modules.wm;
in {
  config = lib.mkIf (cfg.enable && cfg.gnome.enable) {
    programs.gnome-shell = {
      enable = true;
      extensions = with pkgs.gnomeExtensions; [
        {
          # package = paperwm;
          package = tiling-shell;
        }
      ];
    };
    # environment.systemPackages = with pkgs; [
    #   gnome-tweaks
    # ];
  };
}
