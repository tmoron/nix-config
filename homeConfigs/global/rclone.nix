{ config, homeDir, ... }:
{
  programs.rclone.enable = true;
  sops.secrets."nextcloud_fuse/password" = {};
  programs.rclone.remotes.nextcloud = {
    config = {
	  type = "webdav";
	  url = "https://nc.tmoron.fr/remote.php/dav/files/tom";
	  vendor = "nextcloud";
	  user = "tom";
    };
	secrets.pass = config.sops.secrets."nextcloud_fuse/password".path;
	mounts = {
	  "/" = {
	    enable = true;
		mountPoint = "${homeDir}/nextcloud";
		options.vfs-cache-mode = "writes";
	  };
	};
  };
}
