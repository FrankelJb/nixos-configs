{
  config,
  pkgs,
  username,
  ...
}: {
  # Add user to libvirtd group
  users.users.beans.extraGroups = ["libvirtd"];

  # Install necessary packages
  environment.systemPackages = with pkgs; [
    gnome.adwaita-icon-theme
    spice
    spice-gtk
    spice-protocol
    virt-manager
    virt-viewer
    virtiofsd
    win-virtio
    win-spice
  ];

  # Manage the virtualisation services
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [pkgs.OVMFFull.fd];
      };
    };
    spiceUSBRedirection.enable = true;
  };
  services.spice-vdagentd.enable = true;
}
