vim.cmd("autocmd!")
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
-- Highlights
-----------------------------------------------------------
local api = vim.api

-- show cursor line only in active window
local cursorGrp = api.nvim_create_augroup("CursorLine", { clear = true })
api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, { pattern = "*", command = "set cursorline", group = cursorGrp })
api.nvim_create_autocmd(
	{ "InsertEnter", "WinLeave" },
	{ pattern = "*", command = "set nocursorline", group = cursorGrp }
)
api.nvim_create_autocmd(
	{ "BufWinEnter" },
	{ pattern = "*", command = [[highlight LineNr guifg=#2b506e guibg=clear]], group = cursorGrp }
)
-----------------------------------------------------------
-- File types
-----------------------------------------------------------
api.nvim_create_autocmd(
	{ "BufNewFile", "BufRead" },
	{ pattern = "*.es6", command = "setf javascript", group = cursorGrp }
)
api.nvim_create_autocmd(
	{ "BufNewFile", "BufRead" },
	{ pattern = "*.tsx", command = "setf typescriptreact", group = cursorGrp }
)
api.nvim_create_autocmd(
	{ "BufNewFile", "BufRead" },
	{ pattern = "*.md", command = "set filetype=markdown", group = cursorGrp }
)
api.nvim_create_autocmd(
	{ "BufNewFile", "BufRead" },
	{ pattern = "*.mdx", command = "set filetype=markdown", group = cursorGrp }
)
api.nvim_create_autocmd(
	{ "BufNewFile", "BufRead" },
	{ pattern = "*.flow", command = "set filetype=javascript", group = cursorGrp }
)
api.nvim_create_autocmd(
	{ "FileType" },
	{ pattern = "yaml", command = "setlocal shiftwidth=2 tabstop=2", group = cursorGrp }
)
api.nvim_create_autocmd(
	{ "FileType" },
	{ pattern = "ruby", command = "setlocal shiftwidth=2 tabstop=2", group = cursorGrp }
)
