vim.opt.termguicolors = true
local get_hex = require('cokeline/utils').get_hex
local background = nil

local black = '#151515'
local red = '#a53c23'
local green ='#7b9246'
local yellow = '#d3a04d'
local blue = '#5f87af'
--local blue = '#60d7cd'
local magenta = '#9f4e85'
local cyan = '#7dd6cf'
local white = '#ffffff'
local labels = {"e", "u", "j", "k", "p", "i", "a", "o"}

local map = vim.api.nvim_set_keymap

for i = 1,9 do
  map('n', ('g%s'):format(labels[i]),      ('<Plug>(cokeline-focus-%s)'):format(i),  { silent = true })
  map('n', ('gs%s'):format(labels[i]), ('<Plug>(cokeline-switch-%s)'):format(i), { silent = true })
end

require('cokeline').setup({
	default_hl = {
      fg = function(buffer)
		return buffer.is_focused and '#444444' or '#444444'
	  end,

        style = function(buffer)
          return buffer.is_focused and 'bold' or nil
        end,

	},
  components = {
    {
      text = ' ',
	  bg = nil,
    },
    {
      text = '',
      fg = function(buffer)
		return buffer.is_focused and blue or '#444444'
	  end,
      bg = background,
    },
	{
      text = function(buffer) return labels[buffer.index] .. ': ' end,
		fg = function(buffer)
		return buffer.is_focused and "#1c1c1c" or '#eeeeee'
	  end,
	  bg = function(buffer)
		return buffer.is_focused and blue or '#444444'
	  end,
   },
    {
      text = function(buffer) return buffer.filename end,
	  fg = function(buffer)
		return buffer.is_focused and "#1c1c1c" or '#eeeeee'
	  end,
	  bg = function(buffer)
		return buffer.is_focused and blue or '#444444'
	  end,
      hl = {
        style = function(buffer)
          return buffer.is_focused and 'bold' or nil
        end,
      }
    },
    {
      text = '',
        fg = function(buffer)
			return buffer.is_focused and blue or '#444444'
		end,
        bg = background,
    },
  },
})

