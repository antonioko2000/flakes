{pkgs, home, host-name, user-name, ...}: {

nix = {
  gc = {automatic = true; dates = "daily";};
  settings = {
    experimental-features = ["flakes" "nix-command"];
    auto-optimise-store = true;
};};

nixpkgs = {
  config.allowUnfree = true;
};

environment = {
  sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
  systemPackages = with pkgs; [
    neovim # Pending home-manager config
    git # Pending home-manager config
    kitty # Pending home-manager config
    pavucontrol
    firefox # Pending nixos program (+config and import)
    swaynotificationcenter # Pending home-manager config
    discord
    fuzzel
    # (any terminal emulator) # PICK AND CONFIGURE NEXT GEN
    # rclone # TEST NEXT GEN
    # mangohud # TEST NEXT GEN
];};

programs = {
  hyprland.enable = true;
  # gamemode.enable = true; # TEST NEXT GEN
  steam = {
    enable = true;
    # gamescopeSession.enable = true; # TEST NEXT GEN
};};

services = {
  blueman.enable = true;
  xserver = {
    enable = false;
    xkb.layout = "latam";
    videoDrivers = ["nvidia"]; 
  };
  pipewire = {
    enable = true;
    pulse.enable = true;
};};

hardware = {
  nvidia = { 
    open = true; 
    modesetting.enable = true;
  };
  bluetooth = {
    enable = true;
    powerOnBoot = false;
};};

boot.loader = {
  systemd-boot.enable = true; 
  efi.canTouchEfiVariables = true;
};

networking = {
  hostName = host-name; 
  networkmanager.enable = true; 
  firewall.enable = false;
};

console.useXkbConfig = true;
time.timeZone = "Chile/Continental";
i18n.defaultLocale = "en_US.UTF-8";
    
fonts = {
  packages = with pkgs; [gyre-fonts (nerdfonts.override{fonts = ["0xProto"];})];
  fontconfig = {
    enable = true;
    antialias = true;
    hinting = {
      enable = false;
      style = "full";
    };
    defaultFonts = {
      serif = ["TeXGyrePagella"];
      sansSerif = ["TeXGyreAdventor"];
      monospace = ["0xProto Nerd Font Mono"];
      emoji = ["Noto Color Emoji"];
};};};

users.users = { # Remember to set a "#passwd" for all users
  ${user-name} = {
    isNormalUser = true; 
    extraGroups = ["wheel" "networkmanager"];
};};

imports = [
  home.nixosModules.home-manager
  ./nixos/hardware.nix
  ./nixos/home.nix
];

system.stateVersion = "24.05";

}
