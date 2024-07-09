{ inputs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    btrfs-assistant
    duf
    gnome.gnome-disk-utility
    gnome.nautilus
    hexchat
    monero-gui
    mullvad-vpn
    mullvad-browser
    neovide
    restic
    rustic-rs
    pavucontrol
    qimgv
    qbittorrent
    snapper
    typst
    typst-lsp
    usbutils
    veracrypt
    yq-go
  ];
  services.mullvad-vpn.enable = true;
}
