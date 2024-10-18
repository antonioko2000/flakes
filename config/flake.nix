{description = "My current PC NixOS configuration flake (with Home Manager as a module)";

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
    # NixOS nixpkgs.pkgs = locked-unstable after executing nixos-rebuild --flake
    # This allows setting NixOS nixpkgs options while still using the locked flake packages
    nixosConfigurations = {
      ${host-name} = locked-unstable.lib.nixosSystem {
        
	# Custom arguments to be passed to all configuration modules listed at the bottom
	specialArgs = {
          home = locked-home;
          inherit host-name user-name;
        };

        # Flake modules
        modules = [
	  ./nixos.nix
	];

};};};}
