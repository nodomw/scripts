--[[
    IY Plugin written by tostring
    Stealing credit and or releasing without credit can have consequences
    You are free to edit and release an edited version with credits
--]]
local Plugin = {
    ["PluginName"] = "noroot",
    ["PluginDescription"] = "Destroys your humanoidrootpart",
    ["Commands"] = {
        ["noroot"] = {
            ["ListName"] = "noroot",
            ["Description"] = "Destroys your humanoidrootpart",
            ["Aliases"] = {},
            ["Function"] = function(args,speaker)
                local char = game:GetService("Players").LocalPlayer.Character
                char.Parent = game
                char.HumanoidRootPart:Destroy()
                char.Parent = workspace
            end
        }
     }
}

return Plugin