#!/usr/bin/env bash

if [ "$(command -v direnv)" ]; then
    
    eval "$(direnv hook bash)"
    
fi
