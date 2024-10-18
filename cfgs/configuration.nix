{hm, host-name, user-name, upkgs, ...}:

{
  # System programs, variables, packages, and services
  programs = {
    hyprland.enable = true;
  };
  environment = {
    sessionVariables = {
      # NIXOS_OZONE_WL = "1";
    };
    systemPackages = with upkgs; [
      neovim
      kitty
      firefox
      git
  ];};
  services = {
    blueman.enable = true;
    xserver = {
      # enable = false; # Check if XWayland needs it (Xwayland = true at hyprland.nix)
      xkb.layout = "latam";
    };
    pipewire = {
      enable = true;
      pulse.enable = false; # Check if pipewire or volman need it, if so enable it
  };};

  # Hardware
  hardware = {
    # graphics.enable = false; # Enables HW acceleration (packages should enable it if needed)
    # nvidia.modesetting.enable = false; # From NVIDIA propietary driver (can help compositors)
    bluetooth = {
      enable = true;
      powerOnBoot = false; # Default: true
  };};

  # Boot
  boot.loader = {
    systemd-boot.enable = true; 
    efi.canTouchEfiVariables = true;
  };

  # Network
  networking = {
    hostName = host-name; 
    networkmanager.enable = true; 
    firewall.enable = false; # Default: true
  };
 
  # Nix
  nix = {
    gc = {automatic = true; dates = "daily";};
    settings = {
      experimental-features = ["flakes" "nix-command"];
      auto-optimise-store = true; # Default: false (space vs speed)
  };};

  # Console
  console.useXkbConfig = true;
 
  # Locale (language, unit format, character set, timezone, etc)
  time.timeZone = "Chile/Continental";
  i18n.defaultLocale = "en_US.UTF-8";

  # Users (remember to "#passwd" each one)
  users.users = {
    ${user-name} = {
      isNormalUser = true; 
      extraGroups = ["wheel" "networkmanager"];
  };};
    
  # Fonts
  fonts = {
    packages = with upkgs; [gyre-fonts (nerdfonts.override{fonts = ["0xProto"];})];
    fontconfig = {
      enable = true;
      antialias = true;
      hinting = {
        enable = false; # Default: true
        style = "full"; # Default: "slight"
      };
      defaultFonts = {
        serif = ["TeXGyrePagella"];
        sansSerif = ["TeXGyreAdventor"];
        monospace = ["0xProto Nerd Font Mono"];
        emoji = ["Noto Color Emoji"];
  };};};

  # Extensions
  imports = [./hardware-configuration.nix ./home.nix hm.nixosModules.home-manager]; 

  system.stateVersion = "24.05";
}
