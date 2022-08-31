local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
  vim.notify("cmp nvim lsp not ok")
  return
end

M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.update_capabilities(M.capabilities)

M.setup = function()
  local icons = require("thordog.icons")
  local signs = {

    { name = "DiagnosticSignError", text = icons.diagnostics.Error },
    { name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
    { name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
    { name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
  }
  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    -- disable virtual text
    virtual_lines = false,
    virtual_text = false,

    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "if_many", -- Or "always"
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

local function attach_navic(client, bufnr)
  vim.g.navic_silence = true
  local status_ok, navic = pcall(require, "nvim-navic")
  if not status_ok then
    vim.notify("nvim-navic  not ok")
    return
  end
  navic.attach(client, bufnr)
end

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  local nnoremap = require("thordog.keymap").nnoremap
  nnoremap("<C-p>", "<cmd>Telescope find_files<CR>", opts, bufnr)
  nnoremap("gd", "<cmd>Telescope lsp_definitions<CR>", opts, bufnr)
  nnoremap("gD", "<cmd>Telescope lsp_declarations<CR>", opts, bufnr)
  nnoremap("gI", "<cmd>Telescope lsp_implementations<CR>", opts, bufnr)
  nnoremap("gr", "<cmd>Telescope lsp_references<CR>", opts, bufnr)
  nnoremap("gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts, bufnr)
  nnoremap("gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts, bufnr)
  nnoremap("<M-f>", "<cmd>Format<CR>", opts, bufnr)
  nnoremap("<M-a>", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts, bufnr)
  --vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format({ async = true })' ]]
end

M.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)
  attach_navic(client, bufnr)

  if client.name == "tsserver" then
    require("lsp-inlayhints").on_attach(bufnr, client)
  end

  if client.name == "jdt.ls" then
    vim.lsp.codelens.refresh()
    if JAVA_DAP_ACTIVE then
      require("jdtls").setup_dap({ hotcodereplace = "auto" })
      require("jdtls.dap").setup_dap_main_class_configs()
    end
  end
end

function M.enable_format_on_save()
  vim.cmd([[
    augroup format_on_save
      autocmd! 
      autocmd BufWritePre * lua vim.lsp.buf.formatting_seq_sync() 
    augroup end
  ]])
  vim.notify("Enabled format on save")
end

function M.disable_format_on_save()
  M.remove_augroup("format_on_save")
  vim.notify("Disabled format on save")
end

function M.toggle_format_on_save()
  if vim.fn.exists("#format_on_save#BufWritePre") == 0 then
    M.enable_format_on_save()
  else
    M.disable_format_on_save()
  end
end

function M.remove_augroup(name)
  if vim.fn.exists("#" .. name) == 1 then
    vim.cmd("au! " .. name)
  end
end

vim.cmd([[ command! LspToggleAutoFormat execute 'lua require("thordog.lsp.handlers").toggle_format_on_save()' ]])
vim.cmd([[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]])

return M
