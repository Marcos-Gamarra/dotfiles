function n
	# closes (toggles) terminal window in remote nvim instance before opening new file
	nvim --server $NVIM --remote-send "<A-e>"
	nvim --server $NVIM --remote $argv
end

function e 
	z $argv
	nvim --server $NVIM --remote-send "<C-\><C-N>:cd $PWD<CR>"
	nvim --server $NVIM --remote-send "i"
end

function fzn 
	set file_to_open $(fd --type f --hidden --exclude .git | fzf --preview "bat --color always {}" --preview-window=top:50%)
	
	if test -n "$file_to_open"
		n $file_to_open
	end
end

function fze 
	set dir_to_open $(fd --type d --hidden --exclude .git | fzf --preview "lsd --color always --icon always {}" --preview-window=top:50%)
	
	if test -n "$dir_to_open"
		e $dir_to_open
	end
end

abbr --add n n

abbr --add .. e ..
abbr --add ../.. e ../..
abbr --add ../../.. e ../../..
