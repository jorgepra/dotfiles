vim.g.scriptencoding = "utf-8"
vim.g.mapleader = " "

local options = {
	hlsearch = false,
	encoding = "utf-8",
	fileencodings = { "utf-8", "sjis", "euc-jp", "latin" },
	relativenumber=true,
	signcolumn = "number",
	title = true,
	backup = false,
	writebackup = false,
	cmdheight = 1,
	--laststatus=2,
	scrolloff = 10,
	expandtab = true,
	shell = "zsh",
	backupskip = { "/tmp/*", "/private/tmp/*" },
	showcmd = false,
	ruler = false,
	showmatch = false,
	lazyredraw = true,
	ignorecase = true,
	shiftwidth = 2,
	tabstop = 2,
	smartindent = true,
	wrap = false,
	path = vim.opt.path + "**",
	formatoptions = vim.opt.formatoptions + "r",
	wildignorecase = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
--vim.api.nvim_create_autocmd("InsertLeave", {
--  pattern = '*',
--  command = "set nopaste"
--})

-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })

-----------------------------------------------------------
-- cursor highlight
-----------------------------------------------------------

vim.cmd [[
  augroup CursorLine
    autocmd!
    autocmd InsertLeave,WinEnter * set cursorline 
    autocmd InsertEnter,WinLeave * set nocursorline 
  augroup end
]]
-- vim.opt.clipboard:prepend { 'unnamed', 'unnamedplus' }

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
