#!/usr/bin/env fish

if command -v direnv > /dev/null
    
    direnv hook fish | source
    
fi
