{ config, lib, pkgs, ... }:

{
  home.sessionPath = [
    "$HOME/scripts"
  ];

  home.packages = with pkgs; [
    # ls replacement
    exa

    # data
    jq yq
  ];

  programs.fish = {
    enable = true;

    shellAbbrs = {
      rel = "exec $SHELL";
      vim = "nvim";
    };

    shellAliases = {
      ll = "exa -la";
    };

    interactiveShellInit = ''
      function fish_greeting; end
    '';

    functions = {
      signin = "eval (op signin felippe.1password.com)";
    };

    promptInit = ''
      z --add "$PWD"
    '';
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.git = {
    enable = true;
    # TODO "ignores" seems to be causing the build to fail O_o
    # ignores = [ "shell.nix" ".envrc" ];
    userEmail = "public@theocodes.com";
    userName = "Theo Felippe";
    extraConfig = {
      core = {
        excludesfile = "~/.gitignore_global";
      };

      url = {
        "git@github.com:" = { insteadOf = "https://github.com/"; };
      };
    };
  };

  # services.gpg-agent = {
  #   enable = true;
  #   pinentryFlavor = "gtk2";
  # };

  # programs.ssh = {
  #   enable = true;
  # };
}
