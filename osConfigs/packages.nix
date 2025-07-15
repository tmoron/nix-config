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
    nerd-fonts.iosevka
    yubico-pam
  ];
}
