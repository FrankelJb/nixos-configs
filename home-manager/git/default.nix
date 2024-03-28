{pkgs, ...}: {
  programs.git = {
    enable = true;

    userName = "Jonathan Frankel";
    userEmail = "jonathan@habanerojam.xyz";

    extraConfig = {
      init.defaultBranch = "main";
      credential.helper = "store";
    };
  };

  home.packages = [pkgs.gh];
}
