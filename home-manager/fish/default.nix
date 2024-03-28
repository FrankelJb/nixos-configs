{ 
  lib,
  pkgs,
  ...
}:{
  xdg.configFile."fish/functions" = {
    source = lib.cleanSourceWith {
      src = lib.cleanSource ./functions/.;
    };
    recursive = true;
  };
  programs.fish = {
    enable = true;

    plugins = [
# Enable a plugin (here grc for colorized command output) from nixpkgs
# { name = "grc"; src = pkgs.fishPlugins.grc.src; }
    {
      name = "autopair";
      inherit (pkgs.fishPlugins.autopair) src;
    }
    {
      name = "done";
      inherit (pkgs.fishPlugins.done) src;
    }
    {
      name = "fzf-fish";
      inherit (pkgs.fishPlugins.fzf-fish) src;
    }
    {
      name = "forgit";
      inherit (pkgs.fishPlugins.forgit) src;
    }
    {
      name = "tide";
      inherit (pkgs.fishPlugins.tide) src;
    }
    {
      name = "sponge";
      inherit (pkgs.fishPlugins.sponge) src;
    }
    ];
    shellAbbrs = {
      cat = "bat";
      diff = "delta -s";
      k = "kubectl";
      ka = "kubectl apply -f";
      kd = "kubectl delete";
      less = "bat";
      l = "lsd";
      ls = "lsd";
      lll = "lsd -la";
      pip = "pip3";
      sshk = "kitty +kitten ssh";
      vim = "nvim";
    };
  };
}
