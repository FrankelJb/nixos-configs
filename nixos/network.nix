{pkgs, ...}: {
  networking = {
    hostName = "helium";
    firewall = {
      enable = true;
      trustedInterfaces = ["virbr0"];
    };
    networkmanager.enable = true;
    nameservers = ["192.168.1.200"];
  };

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];
}
