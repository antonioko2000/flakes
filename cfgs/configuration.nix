{hm, host-name, user-name, upkgs, ...}:

{
  # System programs, variables, packages, and services
  nixpkgs.config.allowUnfree = true; # Allow unfree software, for drivers and most programs
  programs = {
    hyprland.enable = true;
  };
  environment = {
    sessionVariables = {
      # Forces electron apps to use Wayland, it might make a few programs crash or be worse
      NIXOS_OZONE_WL = "1";
    };
    systemPackages = with upkgs; [
      neovim
      git
      kitty
      pavucontrol
      firefox
      #swaync -> Test on next generation
  ];};
  services = {
    blueman.enable = true;
    xserver = {
      enable = false; # Default: false, false until a program needs it
      xkb.layout = "latam";
    };
    pipewire = {
      enable = true;
      pulse.enable = false; # Check if pavucontrol needs it it, if not, delete all this line
  };};

  # Hardware
  hardware = {
    nvidia.modesetting.enable = false; # Default: false, false until hyprland needs it
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
      auto-optimise-store = true; # Default: false, I care more about disk space
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
