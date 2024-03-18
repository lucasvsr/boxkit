#!/usr/bin/env bash

if [ "$(command -v oc)" ]; then
    
    case "$0" in
        
        "bash")
            
            echo 'command -v oc > /dev/null && eval "$(oc completion bash)"' >> "$HOME"/.bashrc

        ;;
        "zsh")

            echo 'command -v oc > /dev/null && eval "$(oc completion zsh)"' >> "$HOME"/.zshrc
        
        ;;
        
    esac
    
fi
