#!/usr/bin/env fish

if command -v oc > /dev/null
    
    oc completion fish | source
    
fi
