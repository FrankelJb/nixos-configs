{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    pam_u2f
  ];
  security = {
    rtkit.enable = true;
    sudo.enable = true;
    pam.services = {
      login.u2fAuth = true;
      sudo.u2fAuth = true;
      swaylock = {};
    };
  };
}
