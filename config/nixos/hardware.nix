{modulesPath, lib, config, ...}: {
# Default generated hardware-configuration.nix on my machine (except for "devices" & order)

boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod"];
boot.initrd.kernelModules = [];
boot.kernelModules = ["kvm-intel"];
boot.extraModulePackages = [];

swapDevices = [ ];
fileSystems."/" = {device = "/dev/disk/by-label/NIXROOT"; fsType = "ext4";};
fileSystems."/boot" = {
  device = "/dev/disk/by-label/NIXBOOT";
  fsType = "vfat";
  options = ["fmask=0022" "dmask=0022"];
};

networking.useDHCP = lib.mkDefault true;
nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

imports = [
  (modulesPath + "/installer/scan/not-detected.nix")
];

}
