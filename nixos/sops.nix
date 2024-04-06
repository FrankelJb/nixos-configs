{
  inputs,
  config,
  ...
}: {
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  sops = {
    defaultSopsFile = ../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";

    age.keyFile = "/home/beans/.config/sops/age/nix_keys.txt";

    secrets.restic = {
      owner = config.users.users.beans.name;
    };
  };
}
