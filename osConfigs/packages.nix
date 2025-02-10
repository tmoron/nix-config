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
  ];
}
