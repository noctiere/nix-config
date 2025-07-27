{
  inputs,
  pkgs,
  ...
}: {
  # home.packages = with pkgs; [spotify];
   imports = [inputs.spicetify.homeManagerModules.default];
  
   programs.spicetify = let
     spicePkgs = inputs.spicetify.legacyPackages.${pkgs.system};
   in {
     enable = true;
     theme = spicePkgs.themes.dribbblish;
     colorScheme = "rosepine";
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
}
