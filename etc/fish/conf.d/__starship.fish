#!/usr/bin/env fish

if command -v starship > /dev/null
    
    starship init fish | source
    starship completions fish | source
    
fi
