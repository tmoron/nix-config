{lib, inputs, pkgs, ... }:

{
  imports = [
    ../packages.nix 
  ];

  users.users.tom = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" ];
    initialHashedPassword = "";
  }; 
  
  services.getty.autologinUser = lib.mkForce "tom";
  services.getty.helpLine = lib.mkForce "";

  home-manager.extraSpecialArgs = { inherit inputs; inherit pkgs; isOs = true;};
  home-manager.users.tom = {
    imports = [ ../../homeConfigs/home.nix ];
  };
}
