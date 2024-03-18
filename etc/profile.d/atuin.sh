#!/usr/bin/env bash

if [ "$(command -v atuin)" ]; then
    
    case "$0" in
        
        "bash")
            
            echo 'command -v atuin > /dev/null && eval "$(atuin init bash)"' >> "$HOME"/.bashrc

        ;;

        "zsh")

            echo "antigen bundle atuinsh/atuin@main" >> "$HOME"/.zshrc
        
        ;;
        
    esac
    
fi
