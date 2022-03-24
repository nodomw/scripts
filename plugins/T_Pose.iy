local Plugin = {
	["PluginName"] = "T Pose",
	["PluginDescription"] = "Hit that T Pose!",
	["Commands"] = {
		["tpose"] = {
			["Description"] = "Hit that T Pose!",
			["Aliases"] = {'meme'},
			["Function"] = function(args,speaker)
				local Anim = Instance.new("Animation")
                                Anim.AnimationId = "rbxassetid://27432691"
                                local k = game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
                                k:Play()
                                k:AdjustSpeed(1)
                                wait(1.46)
                                k:AdjustSpeed(0)
			end,
		},
	},
}

return Plugin