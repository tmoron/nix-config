{ ... }:
{
    services.displayManager.enable = true;
    services.displayManager.ly.enable = true;
    services.displayManager.ly.settings = {
      animation = "gameoflife";
      min_refresh_delta = 50;
      bigclock = "en";
      sleep_cmd = "systemctl sleep";
      asterisk = "A";
      auth_fails= 3;
    };
}
