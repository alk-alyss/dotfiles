-- DAP - Debugger Adapter Protocol
return {
	'mfussenegger/nvim-dap',
	dependencies = {
		'rcarriga/nvim-dap-ui',
		'mfussenegger/nvim-dap-python',
	},
	config = function ()
		local dap = require("dap")
		local dapui = require("dapui")

		vim.keymap.set('n', '<F5>', dap.continue, {desc = "Launch debugger/Contine"})
		vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, {desc = "Toggle [B]reakpoint"})
		vim.keymap.set('n', '<leader>cb', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, {desc = "Set [C]onditional [B]reakpoint"})
		vim.keymap.set('n', '<leader>lb', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, {desc = "Set [L]ogging [B]reakpoint"})
		vim.keymap.set('n', '<leader>db', dapui.toggle, {desc = "Toggle [D]e[B]ugger UI"})

		dapui.setup({
			controls = {
				element = "repl",
				enabled = false,
				icons = {
					disconnect = "",
					pause = "",
					play = "",
					run_last = "",
					step_back = "",
					step_into = "",
					step_out = "",
					step_over = "",
					terminate = ""
				}
			},
			element_mappings = {},
			expand_lines = true,
			floating = {
				border = "single",
				mappings = {
					close = { "q", "<Esc>" }
				}
			},
			force_buffers = true,
			icons = {
				collapsed = "",
				current_frame = "",
				expanded = ""
			},
			layouts = { {
				elements = { {
					id = "scopes",
					size = 0.25
				}, {
					id = "watches",
					size = 0.25
				}, {
					id = "breakpoints",
					size = 0.25
				}, {
					id = "stacks",
					size = 0.25
				} },
				position = "right",
				size = 60
			}, {
				elements = { {
					id = "repl",
					size = 0.5
				}, {
					id = "console",
					size = 0.5
				} },
				position = "bottom",
				size = 15
			} },
			mappings = {
				edit = "e",
				expand = { "<CR>", "<2-LeftMouse>" },
				open = "o",
				remove = "d",
				repl = "r",
				toggle = "t"
			},
			render = {
				indent = 1,
				max_value_lines = 100
			}
		})

		dap.listeners.after.event_initialized["dapui_config"] = function ()
			dapui.open()
			vim.keymap.set('n', '<C-S-F5>', dap.restart, {desc = "Restart debugger"})
			vim.keymap.set('n', '<S-F5>', dap.terminate, {desc = "Stop debugger"})
			vim.keymap.set('n', '<F6>', dap.run_to_cursor, {desc = "Run to cursor"})
			vim.keymap.set('n', '<F7>', dap.step_over, {desc = "Step over"})
			vim.keymap.set('n', '<F8>', dap.step_into, {desc = "Step into"})
			vim.keymap.set('n', '<F9>', dap.step_out, {desc = "Step out"})
			dap.set_exception_breakpoints("default")
		end
		dap.listeners.after.event_terminated["dapui_config"] = function ()
			-- dapui.close()
		end
		dap.listeners.after.event_exited["dapui_config"] = function ()
			dapui.close()
		end

		require("dap-python").setup(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python")
	end
}
