{ config, lib, pkgs, ... }:

{
    modules-right = ["custom/fans", "custom/dgpu"];
    "custom/dgpu" = {
      exec-if  = "test \"$(supergfxctl -g)\" = \"Hybrid\" || test \"$(supergfxctl -g)\" = \"Vfio\"";
      exec  = "echo \"   on |\"";
      interval-if  = 10;
      interval =100;
    };

    "custom/fans" = {
      exec-if  = "test \"$(cat /sys/class/hwmon/hwmon6/fan1_input)\" -gt 0 -o \"$(cat /sys/class/hwmon/hwmon6/fan2_input)\" -gt 0";
      exec  = "echo \" \" \"$(cat /sys/class/hwmon/hwmon6/fan1_input).$(cat /sys/class/hwmon/hwmon6/fan2_input) |\"";
      interval  = 1;
      interval-if  = 1;
    };
}
