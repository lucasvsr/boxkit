if [ "$(command -v starship)" ]; then

	eval "$(starship init zsh)" && 
	eval "$(starship completions zsh)"
    
fi
