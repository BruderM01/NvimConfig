local fn = vim.fn
-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	--Plugins Here
	--Framework
	use 'wbthomason/packer.nvim'
	use 'nvim-lua/plenary.nvim'
	
	--Latax
	use 'lervag/vimtex'
	
	--snipets
	use 'SirVer/ultisnips'
	use 'honza/vim-snippets'
	
	--Colorschemes
	use { "ellisonleao/gruvbox.nvim" }
	
	--File Navigation
	use {
	'nvim-tree/nvim-tree.lua',
	requires = {
		'nvim-tree/nvim-web-devicons', -- optional, for file icons
	},
	tag = 'nightly' -- optional, updated every week. (see issue #1193)
}
	use "nvim-telescope/telescope.nvim"
  -- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)