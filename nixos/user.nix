{ pkgs, inputs, ...}:
let
  packages = with pkgs; [
    fish
  ];
  username = "beans";
in
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs username; };
    users.${username} = {
      imports = [
        inputs.nixvim.homeManagerModules.nixvim
	(import ./../home-manager)
      ];
      home.username = "${username}";
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "22.11";
      programs.home-manager.enable = true;
    };
  };

  users.users.${username} = {
    description = "${username}";
    extraGroups = [ "networkmanager" "wheel" ];
    initialPassword = "correcthorsebatterystaple";
    isNormalUser = true;
    openssh.authorizedKeys.keys = [
      "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBNXjDxnziYUU/5z0B7yraROj1eqRKSDErLydMHzM/C4UNL8VZ4nGIkL4ZV11n4lHyIwvggWJPu05TCPXpR0Q/0g= beans@nitrogen"
    ];
    shell = pkgs.bash;

  };
  nix.settings.allowed-users = [ "${username}" ];
}

