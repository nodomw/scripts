local Plugin = {
	["PluginName"] = "Enchancer",
	["PluginDescription"] = "Enchance your gameplay graphics.",
	["Commands"] = {
		["grass"] = {
			["ListName"] = "Grass",
			["Descrption"] = "enable the damn grass",
			["Aliases"] = {
				'gr',
				'gras',
				'grassy'
			},
			["Function"] = function(args, speaker)
				workspace.Terrain.Details = true
			end
		},
		["ungrass"] = {
			["ListName"] = "nograss",
			["Descrption"] = "Disable the damn grass!",
			["Aliases"] = {
				'ungr',
				'ungras',
				'ungrassy'
			},
			["Function"] = function(args, speaker)
				workspace.Terrain.Details = false
			end
		},
		["Voxel"] = {
			["ListName"] = "voxel",
			["Description"] = "Switch to voxel simple lighting.",
			["Aliases"] = {
				"Voxel",
				"voxel",
				"vOxel",
				"VOXEL",
				"voXel",
				"voxeL"
			},
			["Function"] = function(args, speaker)
				game:GetService("Lighting").Apperance.Technology = Voxel
			end
		},
		["shadowmap"] = {
			["ListName"] = "shadowmap",
			["Description"] = "Switch to Shadowmap enchanced lighting.",
			["Aliases"] = {
				"Shadowmap",
				"shadow",
				"ShadowMap",
				"SHADOW",
				"Shadow",
				"Shader"
			},
			["Function"] = function(args, speaker)
				game:GetService("Lighting").Apperance.Technology = ShadowMap
			end
		},
		["Voxel"] = {
			["ListName"] = "legacy",
			["Description"] = "Switch to legacy low end lighting.",
			["Aliases"] = {
				"Legacy",
				"LEGACY",
				"lEgacy",
				"legal",
				"lowend",
				"SimpleLight"
			},
			["Function"] = function(args, speaker)
				game:GetService("Lighting").Apperance.Technology = Legacy
			end
		},
		["Voxel"] = {
			["ListName"] = "Shaders",
			["Description"] = "Switch to voxel simple lighting.",
			["Aliases"] = {
				"realisticlighting"
			},
			["Function"] = function(args, speaker)
				game:GetService("Lighting").Apperance.Technology = ShadowMap
				game:GetService("Lighting").Apperance.ShadowSoftness = 0
				game:GetService("Lighting").Apperance.ColorShift_Top = 255, 138, 35
				game:GetService("Lighting").Apperance.Brigthness = 7
				workspace.Terrain.WaterWaveSpeed = 10
				workspace.Terrain.WaterWaveSize = 0.1
				Instance.new("Sunrays", game:GetService("Lighting"))
				Instance.new("Sunrays", workspace.Camera)
			end
		}
	}
}
return Plugin