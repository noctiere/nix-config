# Laptop-specific: power management, battery, wifi
{
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.profiles.laptop;
in {
  options.profiles.laptop.enable = lib.mkEnableOption "Enable laptop-specific configurations for power management, battery, and wifi";

  config = lib.mkIf cfg.enable {
    # Backlight control
    programs.light.enable = true;

    # Lid/power button behavior
    services.logind = {
      settings.Login = {
        HandleLidSwitch = "suspend";
        HandleLidSwitchExternalPower = "suspend";
        HandleLidSwitchDocked = "ignore";
        HandlePowerKey = "suspend";
        HandlePowerKeyLongPress = "poweroff";
      };
    };

    # Battery notifications (via upower)
    services.upower = {
      enable = true;
      # services.upower.allowRiskyCriticalPowerAction must be true if services.upower.criticalPowerAction is set to 'Suspend'.
      # criticalPowerAction = "Suspend";
      # percentageLow = 20;
      # percentageCritical = 10;
    };

    environment.systemPackages = with pkgs; [
      powertop # Power consumption analysis
      acpi # Battery info CLI
      sof-firmware # Sound Open Firmware for better audio support on some laptops
    ];

    # Better wifi power management
    networking.networkmanager.wifi.powersave = true;
  };
}
