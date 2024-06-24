#!/usr/bin/env bash

if [ "$(command -v oc)" ]; then
    
    eval "$(oc completion bash)"
    
fi
