{modulesPath /* local nixos modules */, lib /* basically nixpkgs.pkgs.lib */, config, ...}:

{
# Default from generated hardware-configuration.nix on my machine, except for "devices"
boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod"];
boot.initrd.kernelModules = [ ];
boot.kernelModules = ["kvm-intel"];
boot.extraModulePackages = [ ];
fileSystems."/" = {device = "/dev/disk/by-label/NIXROOT"; fsType = "ext4";};
fileSystems."/boot" = {
  device = "/dev/disk/by-label/NIXBOOT";
  fsType = "vfat";
  options = [ "fmask=0022" "dmask=0022" ];
};
swapDevices = [ ];

# Uses the nixpkgs from the system that has nixpkgs.pkgs from the flake
nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

# Generic solution for network
networking.useDHCP = lib.mkDefault true;

# Default from generated hardware-configuration.nix on my machine
hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

# Extensions 
imports = [(modulesPath + "/installer/scan/not-detected.nix")];
}
