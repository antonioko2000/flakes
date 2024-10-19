{user-name, ...}: {

home-manager = {
  # Needed (enabled) options for using NixOS nixpkgs & custom vm or shell nix builds
  useGlobalPkgs = true;
  useUserPackages = true;
  
  users = {
    ${user-name} = {
      # Home manager
      programs.home-manager.enable = true; 
      home = {
        username = user-name;
        homeDirectory = "/home/${user-name}";
        stateVersion = "24.05";
      };
    
      # Extensions
      imports = [
        ./home/hyprland.nix
      ];
    };

};};}

