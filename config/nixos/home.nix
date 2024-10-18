{user-name, ...}:

{
home-manager = {
  # Uses NixOS global nixpkgs settings to retrieve packages
  # As a module of NixOS config, hm will use the flake pkgs input (<pkgs>.lib.nixosSystem)
  useGlobalPkgs = true;
  
  # Puts hm packages+configurations into /etc/profiles (instead of ~/.nix-profile)
  # This also enables for custom vm or shell builds, so it's better to set as true  
  useUserPackages = true; 
    
users.${user-name} = { # Everything after this bracket uses regular home manager options
  # Home manager options will be enabled
  programs.home-manager.enable = true;
      
  imports = [
    ./home/hyprland.nix
  ];

  home = {
    username = user-name;
    homeDirectory = "/home/${user-name}";
    stateVersion = "24.05";
};};};}

