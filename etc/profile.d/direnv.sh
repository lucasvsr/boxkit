#!/usr/bin/env bash

if [ "$(command -v direnv)" ]; then
    
    case "$0" in
        
        "bash")
            
            eval "$(direnv hook bash)"

        ;;
        "zsh")

            eval "$(direnv hook zsh)"
        
        ;;
        
    esac
    
fi
