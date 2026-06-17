{ pkgs, ... }:
{
  programs.wleave.enable = true;
  programs.wleave.settings.buttons= [
	{
		action = "echo systemctl poweroff";
		keybind = "y";
		label = "shutdown";
		text = "sync and shutdown";
	}
	{
		action = "echo systemctl soft-reboot";
		keybind = "s";
		label = "reboot";
		text = "soft reboot2";
	}
	{
		action = "echo \"touch ~/.nosync && systemctl poweroff\"";
		keybind = "n";
		label = "shutdown";
		text = "shutdown without syncing";
	}
  ];
}
