-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  -- snapshot = "july-24",
  snapshot_path = vim.fn.stdpath "config" .. "/snapshots",
  max_jobs = 50,
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
    prompt_border = "rounded", -- Border style of prompt popups.
  },
}

return packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Color Themes
  --use {"overcache/NeoSolarized", commit = "b94b1a9ad51e2de015266f10fdc6e142f97bd617"}
  use {
    'svrana/neosolarized.nvim', commit = "4e514a1678c01c6ce4b4c1e0fb9d5cd55a7d4d79",
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
  --use "lunarvim/onedarker.nvim"
  --use "lunarvim/darkplus.nvim"

  -- Lua Development
  use {"nvim-lua/popup.nvim", commit = "b7404d35d5d3548a82149238289fa71f7f6de4ac"}
  use {"folke/lua-dev.nvim", commit = "f5c31936fe06fcbeb59b98f69f74f9c2f91abaec"}
  --use "christianchiarulli/lua-dev.nvim"

  -- LSP
  use {"neovim/nvim-lspconfig", commit = "abaf5fb6c496ecc9a19de1c2fbdf87a905138023" }
  use {"williamboman/mason.nvim", commit = "1355e3af9b79c9126bdef0b842e8d9a56c9da755"}
  use {"williamboman/mason-lspconfig.nvim", commit = "d9365e72afb2f876a62cd3cade555dc1a95031d9"}
  use {"jose-elias-alvarez/null-ls.nvim" , commit = "deba57c14aaccd26b5c4bf60912d549ddcdeba9f"}-- for formatters and linters
  use {"ray-x/lsp_signature.nvim", commit = "e65a63858771db3f086c8d904ff5f80705fd962b"}
  use {"SmiteshP/nvim-navic", commit = "94bf6fcb1dc27bdad230d9385da085e72c390019"}
  --use {"simrat39/symbols-outline.nvim", commit = ""}
  --use "b0o/SchemaStore.nvim"
  --use "j-hui/fidget.nvim"
  use {"lvimuser/lsp-inlayhints.nvim", commit = "3652df1dffe57b40ee8c1665d41d3215dae71859"}
  -- use "simrat39/inlay-hints.nvim"
  use {"https://git.sr.ht/~whynothugo/lsp_lines.nvim", commit = "dbfd8e96ec2696e1ceedcd23fd70e842256e3dea"}

  -- Completion
  use {"hrsh7th/nvim-cmp", commit = "828768631bf224a1a63771aefd09c1a072b6fe84"} -- cmdline completions
  use {"hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa"} -- buffer completions
  use {"hrsh7th/cmp-path", commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1"} -- path completions
  use {"hrsh7th/cmp-cmdline", commit = "9c0e331fe78cab7ede1c051c065ee2fc3cf9432e"} -- cmdline completions
  use {"saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36"} -- snippet completions
  use {"hrsh7th/cmp-nvim-lsp", commit = "59224771f91b86d1de12570b4070fe4ad7cd1eeb"}
  use {"hrsh7th/cmp-emoji", commit = "19075c36d5820253d32e2478b6aaf3734aeaafa0"}
  use {"hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21"}
  --use {"onsails/lspkind.nvim", commit = "57e5b5dfbe991151b07d272a06e365a77cc3d0e7"}
  use { "tzachar/cmp-tabnine", commit = "1a8fd2795e4317fd564da269cc64a2fa17ee854e", run = "./install.sh" }
  -- Snippet
  use {"L3MON4D3/LuaSnip", commit = "a82d84ae5433cf2af16124123999bff91e8f9e47"} --snippet engine TODO
  use {"rafamadriz/friendly-snippets" , commit = "e5a16f9346e1fa24147d6d23460ca9b41528ab7e"}

  -- Syntax/Treesitter
  use {"nvim-treesitter/nvim-treesitter", commit = "69388e84c34d40c3d5c7d2f310db13276f2179e1"} -- color syntax 
  use {"JoosepAlviste/nvim-ts-context-commentstring", commit="4d3a68c41a53add8804f471fcc49bb398fe8de08"}

  -- Marks
  --use "christianchiarulli/harpoon" TODO
  --use "MattesGroeger/vim-bookmarks" TODO

  -- Fuzzy finder / Telescope
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.0', commit = "b79cd6c88b3d96b0f49cb7d240807cd59b610cd8",
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  --use "tom-anders/telescope-vim-bookmarks.nvim" TODO

  -- Editing support
  use {"windwp/nvim-autopairs", commit = "0a18e10a0c3fde190437567e40557dcdbbc89ea1"}

  -- Keybinding
  use {"folke/which-key.nvim", commit= "bd4411a2ed4dd8bb69c125e339d837028a6eea71"}

  -- Java
  use {"mfussenegger/nvim-jdtls", commit = "782867324475c451427b7d972f886620da9c5167"}

  -- Debugging
  use {"mfussenegger/nvim-dap", commit = "ad8b0de205a077b66cb301531bdc31c8fc7551b6"} -- TODO
  use {"rcarriga/nvim-dap-ui", commit = "225115ae986b39fdaffaf715e571dd43b3ac9670"}-- TODO
  --use "ravenxrz/DAPInstall.nvim"

  -- Status Line
  use {'kyazdani42/nvim-web-devicons'}
  use {'nvim-lualine/lualine.nvim', commit = "9076378ac1c53684c4fbfcf34b1277018c15c233"}

  -- Comment
  use {"numToStr/Comment.nvim", commit = "80e7746e42fa685077a7941e9022308c7ad6adf8"}
end)
