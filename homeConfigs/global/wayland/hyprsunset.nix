{ ... }:
{
  services.hyprsunset.enable = true;
  services.hyprsunset.settings = {
    profile = [
      {
        time = "9:00";
        identity = true;
        gamma = 1;
      }

      {
        time = "21:30";
        temperature = 5000;
      }
      {
        time = "22:30";
        temperature = 4000;
      }
      {
        time = "23:30";
        temperature = 3000;
      }
      {
        time = "00:30";
        temperature = 2000;
      }

    ];
  };
}
