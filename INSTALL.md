# Installation steps

## Install chezmoi from package manager

If it's provided by the distribution:

    yay -S chezmoi


## Install chezmoi manually

Otherwise, install directly using upstream script,
see https://www.chezmoi.io/install/
It will also pull the dotfiles

    # Just install chezmoi
    # sh -c "$(curl -fsLS get.chezmoi.io/lb)"
    # Install chezmoi and pull the dotfiles
    sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply getzze

## Reload shell

Done!
