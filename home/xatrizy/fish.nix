{ config, pkgs, lib, ... }:

# Ported from CachyOS's cachyos-fish-config, minus everything pacman/Arch-specific
# (grubup, fixpacman, mirror/cachyos-rate-mirrors, cleanup-orphans, apt/apt-get
# jokes, gitpkg/rip/big via expac) - none of that applies on NixOS.
{
  home.packages = with pkgs; [ eza bat fastfetch ];

  programs.fish = {
    enable = true;

    shellAliases = {
      ls = "eza -al --color=always --group-directories-first --icons";
      la = "eza -a --color=always --group-directories-first --icons";
      ll = "eza -l --color=always --group-directories-first --icons";
      lt = "eza -aT --color=always --group-directories-first --icons";
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      grep = "grep --color=auto";
      fgrep = "fgrep --color=auto";
      egrep = "egrep --color=auto";
      psmem = "ps auxf | sort -nr -k 4";
      psmem10 = "ps auxf | sort -nr -k 4 | head -10";
      tarnow = "tar -acf ";
      untar = "tar -zxvf ";
      wget = "wget -c ";
      jctl = "journalctl -p 3 -xb"; # still directly relevant, NixOS is systemd-based
    };

    functions = {
      fish_greeting = "fastfetch";

      fish_prompt = ''
        if set -q __prompt_shown
            printf '\n'
        else
            set -g __prompt_shown 1
        end
        set_color '#ff5555'
        printf '[%s@%s]' (whoami) (hostname)
        set_color normal
        printf ': '
      '';

      history = "builtin history --show-time='%F %T '";

      backup = ''
        cp $argv[1] $argv[1].bak
      '';

      copy = ''
        set count (count $argv | tr -d \n)
        if test "$count" = 2; and test -d "$argv[1]"
            set from (echo $argv[1] | trim-right /)
            set to (echo $argv[2])
            command cp -r $from $to
        else
            command cp $argv
        end
      '';
    };

    interactiveShellInit = ''
      set -x MANROFFOPT "-c"
      set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
    '';
  };
}
