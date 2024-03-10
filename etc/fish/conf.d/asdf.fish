#!/usr/bin/env fish

if test -f "/opt/asdf-vm/asdf.sh"
    
    set ASDF_DATA_DIR $HOME/.local/asdf
    source /opt/asdf-vm/asdf.fish

end