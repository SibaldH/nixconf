-- Minimal Arduino compile/upload/monitor commands driven by arduino-cli,
-- so you never have to leave nvim for the day-to-day loop.
--
-- Create a sketch.yaml next to your .ino once, e.g.:
--   default_fqbn: arduino:avr:uno
--   default_port: /dev/ttyACM0
-- and arduino-cli will pick up board + port automatically — no flags
-- needed below. (arduino-cli sketch new <name> plus
-- `arduino-cli board attach -b <fqbn> -p <port>` will generate this for
-- you from inside the sketch directory.)

local function sketch_root()
	local found = vim.fs.find({ "sketch.yaml", "sketch.yml" }, {
		upward = true,
		path = vim.fn.expand("%:p:h"),
	})[1]
	if found then
		return vim.fs.dirname(found)
	end
	return vim.fn.expand("%:p:h")
end

local function run(cmd)
	vim.cmd("botright split | resize 15")
	vim.fn.termopen(cmd, { cwd = sketch_root() })
	vim.cmd("startinsert")
end

vim.api.nvim_create_user_command("ArduinoCompile", function()
	run("arduino-cli compile")
end, { desc = "Compile the current Arduino sketch (needs sketch.yaml)" })

vim.api.nvim_create_user_command("ArduinoUpload", function()
	run("arduino-cli compile --upload")
end, { desc = "Compile and upload the current Arduino sketch (needs sketch.yaml)" })

vim.api.nvim_create_user_command("ArduinoMonitor", function()
	run("arduino-cli monitor")
end, { desc = "Open the serial monitor for the current Arduino sketch" })

local map = vim.keymap.set
map("n", "<leader>ac", "<cmd>ArduinoCompile<cr>", { desc = "Arduino: compile" })
map("n", "<leader>au", "<cmd>ArduinoUpload<cr>", { desc = "Arduino: upload" })
map("n", "<leader>am", "<cmd>ArduinoMonitor<cr>", { desc = "Arduino: serial monitor" })
