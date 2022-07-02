vim.api.nvim_command'packadd nvim-web-devicons'

local custom_theme = require'lualine.themes.jellybeans'
local background = nil

custom_theme.normal.c.fg = '#ffffff'
custom_theme.normal.c.bg = '#444444'
custom_theme.normal.b.bg = '#444444'
custom_theme.normal.a.bg = '#444444'

--custom_theme.insert.b.bg = '#ffffff'

--custom_theme.visual.b.bg = '#313131'

local black = '#151515' 
local red = '#a53c23' 
local green ='#7b9246' 
local yellow = '#d3a04d' 
local blue = '#5f87af'
local magenta = '#9f4e85' 
local cyan = '#7dd6cf' 
local white = '#ffffff' 

local my_theme = {
  normal = {
    a = { fg = black, bg = nil },
    b = { fg = '#ffffff', bg = '#444444' },
    c = { fg = '#ffffff', bg = '#444444' },
  },

  insert = { a = { fg = black, bg = background } },
  visual = { a = { fg = black, bg = background } },
  replace = { a = { fg = black, bg = background } },

}

local function right()
  return [[ ]]
end

local function left()
  return [[ ]]
end

local function left_no_space()
  return [[]]
end

local function separator_no_space()
	return [[┃]]
end

local function separator()
	return [[ ┃]]
end
require('lualine').setup {
  options = {
	theme= my_theme,
    icons_enabled = true,
    component_separators = {left='┃', right='┃'},
    section_separators = {left='', right=''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {
		{left, separator={left='', right=''}, color = {bg=nil, fg=blue}, padding=0},
		{'mode' , separator={left='', right=''}, color = {bg=blue, fg=black, gui='bold'}},
		{right, separator={left='', right=''}, color = {bg=nil, fg=blue}, padding=0},
		{left_no_space, separator={left='', right=''}, color = {bg=nil, fg='#444444'}, padding=0},
	},
	
    lualine_b = {
		--{'branch', separator={left='', right='┃'}, color = {bg='#444444', fg='#ffffff'}},
		--{'filename', separator={left='', right=''}, color = {bg='#444444', fg='#ffffff'}},
		'branch',
		'filename'
	},
    lualine_c = {
	},
    lualine_x = {
		{right, separator={left='', right=''}, color = {bg=nil, fg='#444444'}, padding=0},
		{left_no_space, separator={left='', right=''}, color = {bg=nil, fg='#444444'}, padding=0},
		--{'encoding', separator={left='', right=' '}, color = {bg='#444444', fg='#ffffff'}},
		--{'fileformat', color = {bg='#444444', fg='#ffffff'}},
		--{separator, separator={left='', right=''}, color = {bg='#444444', fg='#ffffff'}, padding=0},
		--{'filetype',separator={left='', right=' '},colored=false,color={bg='#444444', fg='#ffffff'}},	
		'fileformat',
		{'filetype', colored = false}
	},
    lualine_y = {},
    lualine_z = {
		{right, separator={left='', right=''}, color = {bg=nil, fg='#444444'}, padding=0},
		{left_no_space, separator={left='', right=''}, color = {bg=nil, fg=blue}, padding=0},
		{'progress', separator={left='', right=''}, color = {bg=blue, fg=black, gui='bold'}, padding=0},
		{separator, separator={left='', right=''}, color = {bg=blue, fg=background}, padding=0},
		{'location' , separator={left='', right=''}, color = {bg=blue, fg=black, gui='bold'}, padding=0},
		{right, separator={left='', right=''}, color = {bg=nil, fg=blue}, padding=0},
	}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
