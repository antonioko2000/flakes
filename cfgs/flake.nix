{
  description = "My current PC NixOS install flake (with Home Manager as a module)";
 
  inputs = {
    unstablepackages.url = "github:nixos/nixpkgs/nixos-unstable";
    hm = {
      url = "github:nix-community/home-manager";      
      inputs.nixpkgs.follows = "unstablepackages";
    };
  };

  outputs = {unstablepackages, hm, ...}: 
  let
     host-name = "stale";
     user-name = "togwand";
     system = "x86_64-linux";
     upkgs = unstablepackages.legacyPackages.${system};
  in {
    nixosConfigurations = {
      ${host-name} = unstablepackages.lib.nixosSystem {
        specialArgs = {inherit hm host-name user-name upkgs;};
        modules = [./configuration.nix];
      };
    };
  };
}
