#!/usr/bin/env bash

if [ "$(command -v starship)" ]; then
    
    case "$0" in
        
        "bash")
            
            eval "$(starship init bash)"
            eval "$(starship completions bash)"

        ;;
        "zsh")

            eval "$(starship init zsh)"
            eval "$(starship completions zsh)"
        
        ;;
        
    esac
    
fi
