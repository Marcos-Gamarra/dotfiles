function n
	# closes (toggle) terminal window
	nvim --server $NVIM --remote-send "<A-e>"
	# opens file in remote nvim instance
	nvim --server $NVIM --remote $argv
end

function e --description "cd and keeps nvim's and terminal's pwd in sync"
	z $argv
	nvim --server $NVIM --remote-send "<C-\><C-N>:cd $PWD<CR>"
	nvim --server $NVIM --remote-send "i"
end

abbr --add n n
abbr --add .. e ..
abbr --add ... e ../..
abbr --add .... e ../../..
