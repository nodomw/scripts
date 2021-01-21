local Plugin = {
	["PluginName"] = "Print Coordinates",
	["PluginDescription"] = "Print coordinates.",
	["Commands"] = {
		["printcoords"] = {
			["Description"] = "Print coordinates.",
			["Aliases"] = {'coords'},
			["Function"] = function(args,speaker)
				local coords = tostring(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
                                notify(coords)
                                print(coords)
			end,
		},
	},
}

return Plugin