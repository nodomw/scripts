enabled = false 
used = false

function control()
    plr = game:GetService("Players").LocalPlayer
    char = plr.Character
    hrp = char.HumanoidRootPart
    Mouse = plr:GetMouse()
    clik = Mouse.Button1Down:connect(function()
        if Mouse.Target ~= nil and Mouse.Target.Parent.Name ~= "Workspace" and
            Mouse.Target.Parent:FindFirstChildOfClass("Humanoid") ~= nil then
            npc = Mouse.Target.Parent
            plr.Character = npc
            workspace.CurrentCamera.CameraSubject = npc
            hrp.Anchored = true
            enabled = true 
            used = true
            notify('NPC Control',"Controlling "..npc.Name)
        end
    end)
end

function uncontrol()
    clik:Disconnect()
    game.Players.LocalPlayer.Character = char
    workspace.CurrentCamera.CameraSubject = char
    hrp.Anchored = false
    enabled = false
end
game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Died:Connect(function()
    if used == true then
        uncontrol()
        enabled = false
        used = false
        execCmd('respawn')
    end
end)

local Plugin = {
    ["PluginName"] = "Control NPC",
    ["PluginDescription"] = "BOTTOM TEXT",
    ["Commands"] = {
        ["clickcontrolnpc"] = {
            ["ListName"] = "clickcontrolnpc / ccnpc",
            ["Description"] = "Control NPC (v:",
            ["Aliases"] = {"ccnpc"},
            ["Function"] = function(args, speaker)
                if enabled == true then
                    notify('NPC Control',"Already enabled noob!") 
                else
                    enabled = true
                    control()
                    notify('NPC Control',"Enabled! Click a NPC to control")
                end
            end
        },
        ["uncontrolnpc"] = {
            ["ListName"] = "uncontrolnpc / uncnpc",
            ["Description"] = "no more controlling npc",
            ["Aliases"] = {"uncnpc"},
            ["Function"] = function(args, speaker)
                if enabled == false then
                    notify('NPC Control',"You are not controlling any npc noob!")
                else
                    enabled = false
                    uncontrol()
                    notify('NPC Control',"Uncontrolled "..npc.Name.. " (v:")
                end
            end
        }
    }
}
return Plugin
