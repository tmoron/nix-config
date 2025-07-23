{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    home-manager
    vim
    pciutils
    usbutils
    ntfs3g
    cryptsetup
    acpi
    yubico-pam
  ];
}
