{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
	home-manager
	killall
   	vim
	pciutils
	pigz
	htop
	gnumake
	git
	neofetch
	neovim
	ntfs3g
	clang
	ninja
	gdb
	valgrind
	wget
	cmake
	usbutils
	man-pages
	stress
	ffmpeg
	cryptsetup
	acpi
  ];
}
