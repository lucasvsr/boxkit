#!/usr/bin/env bash

if [ "$(command -v starship)" ]; then
    
    case "$0" in
        
        "bash")

            echo 'command -v starship > /dev/null && eval "$(starship init bash)" && eval "$(starship completions bash)"' >> "$HOME"/.bashrc
            

        ;;
        "zsh")

            echo 'command -v starship > /dev/null && eval "$(starship init zsh)" && eval "$(starship completions zsh)"' >> "$HOME"/.zshrc
        
        ;;
        
    esac
    
fi
