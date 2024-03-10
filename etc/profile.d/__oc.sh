#!/usr/bin/env bash

if [ "$(command -v oc)" ]; then
    
    case "$0" in
        
        "bash")
            
            eval "$(oc completion bash)"

        ;;
        "zsh")

            eval "$(oc completion zsh)"
        
        ;;
        
    esac
    
fi
