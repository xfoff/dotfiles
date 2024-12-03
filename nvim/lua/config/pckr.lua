local function bootstrap_pckr()
  local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

  if true then
    vim.fn.system({
      'git',
      'clone',
      "--filter=blob:none",
      'https://github.com/lewis6991/pckr.nvim',
      pckr_path
    })
  end

  vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

require('pckr').add{
    {'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim'};
    "ellisonleao/gruvbox.nvim";
    "edeneast/nightfox.nvim";
    {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'};
    'nvim-treesitter/playground';
    'theprimeagen/harpoon';
    'mbbill/undotree';
    'preservim/nerdcommenter';
    'alvan/vim-closetag';

    --LSP
    'neovim/nvim-lspconfig';
    'williamboman/mason.nvim';
    'williamboman/mason-lspconfig';
    'hrsh7th/cmp-nvim-lsp';
    'hrsh7th/nvim-cmp';
    'hrsh7th/cmp-buffer';
    'hrsh7th/cmp-path';
    'hrsh7th/cmp-nvim-lua';
    'hrsh7th/cmp-cmdline';
    'hrsh7th/vim-vsnip';
    'ray-x/lsp_signature.nvim';
    'L3MON4D3/LuaSnip';
    'saadparwaiz1/cmp_luasnip';
    'jose-elias-alvarez/nvim-lsp-ts-utils';
    'jose-elias-alvarez/typescript.nvim';
    'jose-elias-alvarez/null-ls.nvim';
    'onsails/lspkind-nvim';

    --Hmm
    'kylechui/nvim-surround';
    'windwp/nvim-ts-autotag';
}
