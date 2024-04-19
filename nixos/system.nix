{
  self,
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [./nh.nix];

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
      substituters = ["https://nix-gaming.cachix.org"];
      trusted-public-keys = ["nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="];
    };
  };
  # nixpkgs = {
  #   overlays = [
  #     self.overlays.default
  #     inputs.nur.overlay
  #   ];
  # };

  environment.systemPackages = with pkgs; [
    git
    home-manager
    usbutils
    wget
  ];

  time.timeZone = "Asia/Singapore";
  i18n.defaultLocale = "en_US.UTF-8";
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "23.11";
}
