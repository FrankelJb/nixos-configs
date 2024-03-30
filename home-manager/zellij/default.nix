{inputs, ...}: {
  programs.zellij = {
    enable = true;
    enableBashIntegration = true;
  };
  xdg.configFile = {
    "zellij/config.kdl".source = ./config/config.kdl;
  };
}
