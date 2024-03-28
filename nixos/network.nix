{ pkgs, ... }: 
{
  networking = {
    hostName = "helium";
    networkmanager.enable = true;
    nameservers = [ "192.168.1.200" ];
  };

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];
}
