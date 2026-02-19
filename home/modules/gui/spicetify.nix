{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  cfg = config.hmModules.gui.spicetify;
in {
  imports = [inputs.spicetify.homeManagerModules.default];

  options.hmModules.gui.spicetify.enable = lib.mkEnableOption "Whether to enable Spicetify - Spotify Customizer and Extension Manager";

  config = lib.mkIf cfg.enable {
    stylix.targets.spicetify.enable = false;

    programs.spicetify = let
      spicePkgs = inputs.spicetify.legacyPackages.${pkgs.system};
    in {
      enable = true;
      # theme = spicePkgs.themes.dribbblish;
      # colorScheme = "rosepine";
      enabledCustomApps = with spicePkgs.apps; [
        # newReleases
        lyricsPlus
        # historyInSidebar
        # marketplace
      ];
      enabledExtensions = with spicePkgs.extensions; [
        fullAppDisplay
        betterGenres
        fullAlbumDate
        keyboardShortcut
        shuffle # shuffle+ (special characters are sanitized out of extension names)
      ];
      # enabledSnippets = with spicePkgs.snippets; [
      #   rotatingCoverart
      #   pointer
      # ];
    };
  };
}
