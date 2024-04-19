{...}: {
  xdg.configFile."rustic/rustic.toml".text = ''
    [repository]
    repository = "/data/nvme2/backups/restic"
    password-file = "/run/secrets/restic"

    [[copy.targets]]
    repository = "sftp:beans@hydrogen.localdomain:/mnt/raid/backup/backups/rustic"
    password-file = "/run/secrets/restic"

    [backup]
    git-ignore = true

    [[backup.sources]]
    source = "/data/nvme1"
    glob = [
      "!/data/nvme1/.Trash-1000",
      "!/data/nvme1/virt",
      "!/data/nvme1/Games",
      "!/data/nvme1/SteamLibrary",
      "!/data/nvme1/Downloads"
    ]

    [global]
    log-level = "debug"
    log-file = "/tmp/rustic.log" # Default: not set
  '';
}
