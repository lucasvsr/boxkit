#!/usr/bin/env fish

if test -f "/opt/asdf-vm/asdf.sh" ; then
    
    set ASDF_DATA_DIR $HOME/.local/asdf
    source /opt/asdf-vm/asdf.fish

end