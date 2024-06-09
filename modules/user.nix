{
    pkgs,
    ...
}: {
  users = {
    users = {
      tom = {
        isNormalUser = true;
        description = "tom";
        initialPassword = "123456";
        shell = pkgs.zsh;
        extraGroups = ["networkmanager" "wheel" "input" "docker" "kvm" "libvirtd"];
      };
    };
  };

  # Enable and configure `doas`.
  security = {
    sudo = {
      enable = false;
    };
    doas = {
      enable = true;
      extraRules = [
        {
          users = ["tom"];
          keepEnv = true;
          persist = true;
        }
      ];
    };
  };
}