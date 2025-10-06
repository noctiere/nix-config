{
  # Enabling custom system modules
  modules = {
    audio.enable = true;
    styles = {
      fonts.enable = true;
      theme = {
        stylix.enable = true;
        polarity = "dark";
        colorScheme = "everforest-dark-hard";
      };
    };
    wm = {
      enable = true;
      hyprland.enable = true;
      gnome.enable = false;
      cosmic.enable = false;
      plasma.enable = false;
    };
    nh = {
      enable = true;
      numOfGens = "5";
      timeRange = "3d";
    };
  };
}
