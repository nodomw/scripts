local Plugin = {
    ["PluginName"] = "Soft TP",
    ["PluginDescription"] = "You can teleport to players with bypassing anti teleport",
    ["Commands"] = {
        ["softtp"] = {
            ["Description"] = "This script is bypassses anti teleport",
            ["Aliases"] = {"stp"},
            ["Function"] = function(args,speaker)
			
            local player = game.Players.LocalPlayer
			local players = getPlayer(args[1], speaker)
			Players = game:GetService("Players")
			
			for i,v in pairs(players) do
				game:GetService("TweenService"):Create(speaker.Character.HumanoidRootPart, TweenInfo.new(speaker:DistanceFromCharacter(game:GetService("Workspace")[Players[v].Name].HumanoidRootPart.Position)/300, Enum.EasingStyle.Linear), {CFrame = game:GetService("Workspace")[Players[v].Name].HumanoidRootPart.CFrame}):Play()
				wait(speaker:DistanceFromCharacter(game:GetService("Workspace")[Players[v].Name].HumanoidRootPart.Position)/300)
			end
			
            end
        }
     },
}

return Plugin
