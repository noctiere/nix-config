{
  # Enabling custom modules
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
  };

  windowManager = {
    enable = true;
    hyprland.enable = true;
    gnome.enable = false;
    cosmic.enable = false;
    plasma.enable = false;
  };
}
