{
  config,
  lib,
  ...
}: let
  cfg = config.hmModules.tui.spotifyd;
in {
  options.hmModules.tui.spotifyd.enable = lib.mkEnableOption "Whether to enable SpotifyD connect";

  config = lib.mkIf cfg.enable {
    services.spotifyd = {
      enable = true;
      settings = {
        global = {
          device_name = "omen-nixos";
          device_type = "computer";
          use_mpris = true;
          username = "noctiere";
        };
      };
    };
  };
}
