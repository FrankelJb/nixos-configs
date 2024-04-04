{inputs, ...}: {
  imports = [
    inputs.nh.nixosModules.default
  ];

  # nh default flake
  environment.variables.FLAKE = "/home/beans/projects/nixos-configs";

  nh = {
    enable = true;
    # weekly cleanup
    clean = {
      enable = true;
      extraArgs = "--keep-since 7d";
    };
  };
}
