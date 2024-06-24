#!/usr/bin/env bash

if [ "$(command -v starship)" ]; then
    
    eval "$(starship init bash)" && 
    eval "$(starship completions bash)"
    
fi
