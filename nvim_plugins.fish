#install neovim plugins
mkdir -p ~/.local/share/nvim/site/pack/plugins/start
cd ~/.local/share/nvim/site/pack/plugins/start
git clone https://github.com/lukas-reineke/indent-blankline.nvim
git clone https://github.com/neovim/nvim-lspconfig
git clone https://github.com/nvim-treesitter/nvim-treesitter
git clone https://github.com/anuvyklack/hydra.nvim
git clone https://github.com/ggandor/leap.nvim
git clone https://github.com/github/copilot.vim
git clone https://github.com/nvim-tree/nvim-tree.lua
git clone https://github.com/nvim-lua/plenary.nvim
git clone https://github.com/nvim-telescope/telescope.nvim
git clone https://github.com/Marcos-Gamarra/efe

sudo curl -Lo /usr/bin/theme.sh 'https://git.io/JM70M' && sudo chmod +x /usr/bin/theme.sh
pacman -S --noconfirm sudo foot 

