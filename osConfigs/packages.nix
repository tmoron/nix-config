{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    lrzip
	home-manager
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
	cryptsetup
	acpi
	dconf

	ffmpeg-full
	nv-codec-headers
  ];
}
