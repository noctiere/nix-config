{
  # Enabling custom system modules
  modules = {
    audio.enable = true;
    styles = {
      fonts.enable = true;
      theme = {
        stylix.enable = true;
        polarity = "dark";
        colorScheme = "kanagawa-dragon";
      };
    };
    wm = {
      enable = true;
      niri.enable = true;
      # mangowc.enable = true;
      # hyprland.enable = true;
      # gnome.enable = true;
      # cosmic.enable = true;
      # plasma.enable = true;
    };
    nh = {
      enable = true;
      numOfGens = "5";
      timeRange = "3d";
    };
  };
}
