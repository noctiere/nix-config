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
    # Power management
    # services.power-profiles-daemon.enable = lib.mkDefault false; # conflicts with tlp
    # (works with hp-wmi)
    services.power-profiles-daemon.enable = true; # conflicts with tlp
    services.tlp = {
      enable = false;
      # settings = {
      # RUNTIME_PM_ON_AC = "on";
      # Ensure the GPU PCIe port doesn't enter low power states
      # PCIE_ASPM_ON_AC = "performance";
      #   CPU_SCALING_GOVERNOR_ON_AC = "performance";
      #   CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      #   CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      #   CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

      #   # Battery charge thresholds (if supported)
      #   START_CHARGE_THRESH_BAT0 = 40;
      #   STOP_CHARGE_THRESH_BAT0 = 80;
      # };
    };

    # Thermald for thermal management
    # systemctl > unsupported cpu model or platform
    services.thermald.enable = false;

    # Auto-cpufreq as alternative to tlp (pick one)
    # services.auto-cpufreq.enable = true;

    # Backlight control
    programs.light.enable = true;

    # Lid/power button behavior
    services.logind = {
      settings.Login = {
        HandleLidSwitch = "suspend";
        HandleLidSwitchExternalPower = "ignore";
        HandlePowerKey = "suspend";
      };
    };

    # Battery notifications (via upower)
    services.upower = {
      enable = true;
      criticalPowerAction = "Hibernate";
      percentageLow = 20;
      percentageCritical = 10;
    };

    environment.systemPackages = with pkgs; [
      powertop # Power consumption analysis
      acpi # Battery info CLI
      power-profiles-daemon # for powerprofilesctl CLI
    ];

    # Better wifi power management
    networking.networkmanager.wifi.powersave = true;
  };
}
