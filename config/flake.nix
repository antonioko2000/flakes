{ 
description = "My current PC NixOS configuration flake (with Home Manager as a module)";

inputs = {
  locked-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  locked-home = {
    inputs.nixpkgs.follows = "locked-unstable";
    url = "github:nix-community/home-manager";      
};};

outputs = {locked-unstable,locked-home,...}:
let 
  host-name = "stale";
  user-name = "togwand";
in {
  # When rebuilding nixos with a flake, nixpkgs.pkgs will be set to <input>.lib.nixosSystem
  # This means nixpkgs.pkgs = locked-unstable after executing nixos-rebuild --flake
  # This allows setting nixpkgs NixOS options while still using the locked flake input
  nixosConfigurations = {
    ${host-name} = locked-unstable.lib.nixosSystem {
      modules = [./nixos.nix];
      specialArgs = {
        home = locked-home;
        inherit host-name user-name;
};};};};}
