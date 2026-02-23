{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.hmModules.gui.spotify;
in {
  options.hmModules.gui.spotify.enable = lib.mkEnableOption "Whether to enable Spotify - Play music from the Spotify music service";

  config = lib.mkIf cfg.enable {
    nixpkgs.config.allowUnfreePredicate = pkg:
      builtins.elem (lib.getName pkg) [
        "spotify"
      ];

    home.packages = with pkgs; [
      spotify
    ];
  };
}
