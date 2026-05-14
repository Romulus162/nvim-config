return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dapui.setup()

		dap.adapters.python = {
			type = "executable",
			--mint machine
			--command = vim.fn.expand("~/.local/bin/debugpy-adapter"),
			--gentoo machine
			command = vim.fn.expand("~/.venvs/debugpy/bin/python"),
			args = { "-m", "debugpy.adapter" },
		}

		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
				args = { "--port", "${port}" },
			},
		}

		dap.configurations.rust = {
			{
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					local cwd = vim.fn.getcwd()
					local handle = io.popen("cargo metadata --no-deps --format-version 1")
					if handle == nil then
						return cwd .. "/target/debug/"
					end

					local result = handle:read("*a")
					handle:close()

					local ok, json = pcall(vim.fn.json_decode, result)
					if not ok or not json.packages then
						return cwd .. "/target/debug/"
					end

					for _, pkg in ipairs(json.packages) do
						for _, target in ipairs(pkg.targets) do
							if target.kind[1] == "bin" then
								return cwd .. "/target/debug/" .. target.name
							end
						end
					end

					return cwd .. "/target/debug/"
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				console = "integratedTerminal",
			},
		}

		--mint
		dap.configurations.python = {
			{
				type = "python",
				request = "launch",
				name = "Launch file",

				program = "${file}",
				pythonPath = function()
					return "python"
				end,
			},
		}
		--gentoo
		dap.configurations.python = {
			{
				type = "python",
				request = "launch",
				name = "Launch current file",
				program = "${file}",
				pythonPath = function()
					local venv = vim.fn.getcwd() .. "/.venv/bin/python"
					if vim.fn.executable(venv) == 1 then
						return venv
					end
					return vim.fn.exepath("python3") or "python3"
				end,
			},
		}


		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set("n", "<Leader>dc", dap.continue, {})
		vim.keymap.set("n", "<Leader>di", dap.step_into, {})
		vim.keymap.set("n", "<Leader>do", dap.step_over, {})
		vim.keymap.set("n", "<Leader>dO", dap.step_out, {})
		vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<Leader>dr", dap.repl.open, {})

		vim.keymap.set("n", "<leader>dw", function()
			require("dapui").elements.watches.add(vim.fn.expand("<cword>"))
		end)

		vim.keymap.set("n", "<Leader>dq", function()
			require("dap").terminate()
			require("dapui").close()
		end)
	end,
}
