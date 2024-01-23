return {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
	require('telescope').setup({ })
	local builtin = require('telescope.builtin')

	vim.keymap.set('n', '<c-p>', builtin.find_files, { })
	vim.keymap.set('n', '<c-g>', builtin.live_grep, { })
    end
}
