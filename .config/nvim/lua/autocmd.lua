local api = vim.api
local settings = require("settings")

--- Remove all trailing whitespace on save
local TringWhiteSpaceGrp = api.nvim_create_augroup("TrimWhiteSpaceGrp", { clear = true})
api.nvim_create_autocmd("BufWritePre", {
	command = [[:%s/\s\+$//e]],
	group = TrimWhiteSpaceGrp,
})

-- Don't auto-comment new line
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- Show cursor line only in active window
local cursorGrp = api.nvim_create_augroup("CursorLine", { clear = true })
api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
	pattern = "*",
	command = "set cursorline",
	group = cursorGrp,
})
api.nvim_create_autocmd(
	{ "InsertEnter", "WinLeave" },
	{ pattern = "*", command = "set nocursorline", group = cursorGrp }
)

-- Automatically run PackerSync on save of plugins.lua
if settings.packer_auto_sync then
	-- source plugins.lua and run PackerSync on save
	local sync_packer = function()
		vim.api.nvim_command("runtime lua/plugins.lua")
		require("packer").sync()
	end
	api.nvim_create_autocmd({ "BufWritePost" }, {
		pattern = { "plugins.lua" },
		callback = sync_packer,
	})
end
