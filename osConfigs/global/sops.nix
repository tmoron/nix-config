{lib, ...}:

{
  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    age.keyFile = "/home/tom/.config/sops/age/keys.txt";
  };
}
