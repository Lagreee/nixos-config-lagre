{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    gcc
    kdePackages.kdenlive
    vscode
    networkmanagerapplet
    # jetbrains.pycharm-professional
    # jre8
    # qemu
    # quickemu
  ];
}
