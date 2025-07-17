{ user, hostname, ... }:{
  networking.networkmanager.enable = true;
  networking.hostName = "${user}-${hostname}";
}
