{pkgs, ...}: {
  services.usbmuxd.enable = true;
  users.users.beans.extraGroups = ["fuse"];

  environment.systemPackages = with pkgs; [
    libimobiledevice
    ifuse # optional, to mount using 'ifuse'
  ];
}
