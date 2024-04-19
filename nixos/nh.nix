{...}: {
  # nh default flake
  environment.variables.FLAKE = "/home/beans/projects/nixos-configs";

  programs.nh = {
    enable = true;
    # weekly cleanup
    clean = {
      enable = true;
      extraArgs = "--keep-since 7d";
    };
  };
}
