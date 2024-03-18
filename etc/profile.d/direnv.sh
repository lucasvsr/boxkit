#!/usr/bin/env bash

if [ "$(command -v direnv)" ]; then
    
    case "$0" in
        
        "bash")
            
            echo 'command -v direnv > /dev/null && eval "$(direnv hook bash)"' >> "$HOME"/.bashrc

        ;;
        "zsh")

            echo 'command -v direnv > /dev/null && eval "$(direnv hook bash)"' >> "$HOME"/.zshrc
        
        ;;
        
    esac
    
fi
