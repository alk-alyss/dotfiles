-- Smooth scrolling
return {
	'karb94/neoscroll.nvim',
	config = function ()
		require('neoscroll').setup()

		require('neoscroll.config').set_mappings {
			['<C-u>'] = { 'scroll', { '-vim.wo.scroll', 'true', '50' } },
			['<C-d>'] = { 'scroll', { 'vim.wo.scroll', 'true', '50' } },
		}
	end
}
