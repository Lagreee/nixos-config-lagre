{ pkgs, stateVersion, hostname, user, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./local-packages.nix
    ../../nixos/modules
  ];

  environment.systemPackages = [ pkgs.home-manager ];

  networking.hostName = "${user}-${hostname}";

  system.stateVersion = stateVersion;
}

