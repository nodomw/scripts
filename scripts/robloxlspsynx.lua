repeat
	wait()
until game:IsLoaded()
loadstring(
	game:HttpGet("https://raw.githubusercontent.com/yafyz/roblox_lsp_synx/main/support_code.lua")
		.. "\n"
		.. game:HttpGet("https://raw.githubusercontent.com/yafyz/roblox_lsp_synx/main/lsp.lua")
)()
