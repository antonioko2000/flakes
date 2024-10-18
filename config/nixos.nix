{pkgs, home, host-name, user-name, ...}: {

# Programs, services, etc

environment = {
  sessionVariables = {
    NIXOS_OZONE_WL = "1"; # Hints programs to use Wayland (unstable but better rendering)
  };
  systemPackages = with pkgs; [
    neovim # Home-manager config pending
    git # Home-manager config pending
    kitty # Home-manager config pending
    pavucontrol
    firefox # Move to programs + nixos config pending (on a .nix imported file)
    swaynotificationcenter # Home-manager config pending
    discord # --------------- GEN 7 - TESTING DISCORD
    # mangohud # TEST ON GEN ??? | Home-manager config pending
    # rclone # TEST ON GEN ??? (for retrieving collection from cloud)
];};

programs = {
  hyprland.enable = true;
  # gamemode.enable = true; # TEST ON GEN ???
  steam = {
    enable = true; # ------------------- GEN 7 - TESTING STEAM
    # gamescopeSession.enable = true; # TEST ON GEN ???
};};

services = {
  blueman.enable = true;
  xserver = {
    enable = false; # Default: false, false until a program needs it
    xkb.layout = "latam";
    videoDrivers = ["nvidia"]; 
  };
  pipewire = {
    enable = true;
    pulse.enable = true; # Default: false, but it allows pavucontrol to manage audio
};};

# General options

hardware = {
  nvidia = { 
    open = true; 
    modesetting.enable = true; # Default: false, but it fixes weird graphical glitches with nvidia
  };
  bluetooth = {
    enable = true;
    powerOnBoot = false; # Default: true, but I prefer to enable bluetooth manually/boot
};};

boot.loader = {
  systemd-boot.enable = true; 
  efi.canTouchEfiVariables = true;
};

networking = {
  hostName = host-name; 
  networkmanager.enable = true; 
  firewall.enable = false; # Default: true, I do not even know how to use firewalls
};
 
console.useXkbConfig = true;
time.timeZone = "Chile/Continental";
i18n.defaultLocale = "en_US.UTF-8";

# Remember to "#passwd" each user
users.users = {
  ${user-name} = {
    isNormalUser = true; 
    extraGroups = ["wheel" "networkmanager"];
};};
    
fonts = {
  packages = with pkgs; [gyre-fonts (nerdfonts.override{fonts = ["0xProto"];})];
  fontconfig = {
    enable = true;
    antialias = true;
    hinting = {
      enable = false; # Default: true, I could enable it but I think hinting is meh
      style = "full"; # Default: "slight"
    };
    defaultFonts = {
      serif = ["TeXGyrePagella"];
      sansSerif = ["TeXGyreAdventor"];
      monospace = ["0xProto Nerd Font Mono"];
      emoji = ["Noto Color Emoji"];
};};};


# System options

nix = {
  gc = {automatic = true; dates = "daily";};
  settings = {
    experimental-features = ["flakes" "nix-command"];
    auto-optimise-store = true; # Default: false, I care more about disk space
};};

nixpkgs = {
  config.allowUnfree = true; # RIP GNU
};

system.stateVersion = "24.05";

# Extensions
imports = [
  ./nixos/hardware.nix
  ./nixos/home.nix
  home.nixosModules.home-manager
];

}
