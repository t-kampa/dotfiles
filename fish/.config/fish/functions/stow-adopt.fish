function stow-adopt --argument-names pkg
    set -l paths $argv[2..-1]
    if test (count $paths) -eq 0
        echo "usage: stow-adopt <package> <path> [<path> ...]"
        return 1
    end

    for p in $paths
        mkdir -p ~/dotfiles/$pkg/(dirname $p)
        cp -R ~/$p ~/dotfiles/$pkg/(dirname $p)/
    end

    stow -n -v -t ~ $pkg

    for p in $paths
        if test -e ~/$p -a ! -L ~/$p
            mv ~/$p ~/$p.bak
            echo "moved ~/$p -> ~/$p.bak"
        end
    end

    stow -v -t ~ $pkg

    for p in $paths
        readlink ~/$p
    end
end
