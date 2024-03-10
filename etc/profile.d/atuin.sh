#!/usr/bin/env bash

if [ "$(command -v atuin)" ]; then
    
    case "$0" in
        
        "bash")
            
            eval "$(atuin init bash)"

        ;;
        "zsh")

            . /usr/share/zsh/share/antigen.zsh
            antigen bundle atuinsh/atuin@main
        
        ;;
        
    esac
    
fi
