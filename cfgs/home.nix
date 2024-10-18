{user-name, ...}:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${user-name} = {
      home.username = user-name;
      home.homeDirectory = "/home/${user-name}";
      home.stateVersion = "24.05";
      programs.home-manager.enable = true;
      imports = [
        ./modules/hyprland.nix
      ];
    };
  };
}

