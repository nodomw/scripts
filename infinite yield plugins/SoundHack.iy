local ToggleLoop = false
local TotalSounds = 0
local Marketplace = game:GetService("MarketplaceService")

local Plugin = {
    ["PluginName"] = "SoundHack",
    ["PluginDescription"] = "Allows you to experiment with sounds in Roblox",
    ["Commands"] = {
        ["soundcheck"] = {
            ["ListName"] = "soundcheck / scheck",
            ["Description"] = "Checks if game sound can be exploitable.",
            ["Aliases"] = {'scheck'},
            ["Function"] = function(args, speaker)
                if game:GetService("SoundService").RespectFilteringEnabled == false then
					notify("SoundHack", "Sounds can be exploited.")
                else
					notify("SoundHack", "Sounds can't be exploited.")
                end
            end,
        },
        ["soundplay"] = {
            ["ListName"] = "soundplay / splay",
            ["Description"] = "Plays all sound in game.",
            ["Aliases"] = {'splay'},
            ["Function"] = function(args, speaker)
                for i,v in pairs(game:GetDescendants()) do
                    if v:IsA("Sound") then
                        v:Play()
                    end
                end
                notify("SoundHack", "Finished playing sounds.")
            end,
        },
        ["soundstop"] = {
            ["ListName"] = "soundstop / sstop",
            ["Description"] = "Plays all sound in game.",
            ["Aliases"] = {'sstop'},
            ["Function"] = function(args, speaker)
                for i,v in pairs(game:GetDescendants()) do
                    if v:IsA("Sound") then
                        v:Stop()
                    end
                end
                notify("SoundHack", "Finished stopping sounds.")
            end,
        },
        ["soundloop"] = {
            ["ListName"] = "soundloop / sloup",
            ["Description"] = "Toggle looping of all sounds in game.",
            ["Aliases"] = {'sloop'},
            ["Function"] = function(args, speaker)
                ToggleLoop = not ToggleLoop
				if not ToggleLoop then
				    for i,v in pairs(game:GetDescendants()) do
						if v:IsA("Sound") then
							v:Stop()
						end
                    end
                    notify("SoundHack", "Looping has now stopped.")
                end
                while ToggleLoop do
                    wait(5)
                    for i,v in pairs(game:GetDescendants()) do
                        if v:IsA("Sound") and v.IsPlaying == false then
                            v:Play()
                        end
                    end
                end
                notify("SoundHack", "Looping is now: "..tostring(ToggleLoop))
            end,
        },
        ["soundnum"] = {
            ["ListName"] = "soundnum / snum",
            ["Description"] = "Counts how many sounds are in-game.",
            ["Aliases"] = {'snum'},
            ["Function"] = function(args, speaker)
                TotalSounds = 0
                for i,v in pairs(game:GetDescendants()) do
                    if v:IsA("Sound") then
                        TotalSounds = TotalSounds + 1
                    end
                end
                notify("SoundHack", "There are "..tostring(TotalSounds).." sounds in the game.")
            end,
        },
		["soundpause"] = {
            ["ListName"] = "soundpause / spause",
            ["Description"] = "Pauses all non-paused sounds in-game.",
            ["Aliases"] = {'spause'},
            ["Function"] = function(args, speaker)
                for i,v in pairs(game:GetDescendants()) do
                    if v:IsA("Sound") and v.IsPaused == false then
                        v:Pause()
                    end
                end
                notify("SoundHack", "Finished pausing sounds.")
            end,
        },
		["soundresume"] = {
            ["ListName"] = "soundresume / sresume",
            ["Description"] = "Resumes all paused sounds in-game.",
            ["Aliases"] = {'sresume'},
            ["Function"] = function(args, speaker)
                for i,v in pairs(game:GetDescendants()) do
                    if v:IsA("Sound") and v.IsPaused then
                        v:Resume()
                    end
                end
                notify("SoundHack", "Finished resuming sounds.")
            end,
        },
		["soundpitch"] = {
            ["ListName"] = "soundpitch / spitch",
            ["Description"] = "Sets all sounds pitch in-game.",
            ["Aliases"] = {'spitch'},
            ["Function"] = function(args, speaker)
                for i,v in pairs(game:GetDescendants()) do
                    if v:IsA("Sound") then
                        v.PlaybackSpeed = tonumber(args[1])
                    end
                end
                notify("SoundHack", "Finished changing pitch of all sounds.")
            end,
        },
        ["soundvolume"] = {
            ["ListName"] = "soundvolume / svolume",
            ["Description"] = "Sets all sounds volume in-game. (Max Volume is 10)",
            ["Aliases"] = {'svolume'},
            ["Function"] = function(args, speaker)
                for i,v in pairs(game:GetDescendants()) do
                    if v:IsA("Sound") then
                        v.Volume = tonumber(args[1])
                    end
                end
                notify("SoundHack", "Finished changing volume of all sounds.")
            end,
        },
        ["soundexecute"] = {
            ["ListName"] = "soundexecute / sexecute",
            ["Description"] = "Plays a single sound. Example Usage: sexecute workspace.Alarm, or you can use it to scan an area.",
            ["Aliases"] = {'sexecute'},
            ["Function"] = function(args, speaker)
                local Path = tostring(args[1])
                if Path ~= nil then
                    if Path:IsA("Sound") then
                        Path:Play()
                    else
                        for i,v in pairs(Path:GetDescendants()) do
                            if v:IsA("Sound") then
                                v:Play()
                            end
                        end
                    end
                else
                    notify("SoundHack", "The sound can't be in nil.")
                end
                notify("SoundHack", "Finished changing volume of all sounds.")
            end,
        },
		["soundid"] = {
            ["ListName"] = "soundid / sid",
            ["Description"] = "Play your own music! [NON-FE].",
            ["Aliases"] = {'sid'},
            ["Function"] = function(args, speaker)
				local soundid = tostring(args[1])
				local asset = Marketplace:GetProductInfo(tonumber(args[1]))
				delay(3, function()
				notify("SoundHack", "Check out console [F9] to view extra statistics of sound id!")
				end)
				warn("Sound name: "..tostring(asset.Name)..", Description: \n "..tostring(asset.Description))
				warn("The sound was created at : "..tostring(asset.Created)..", and was last updated at: "..tostring(asset.Updated))
				notify("SoundHack", "Now playing: "..tostring(asset.Name))
				local Sound = Instance.new("Sound", game:GetService("CoreGui"):FindFirstChild("RobloxGui"))
				Sound.SoundId = "rbxassetid://"..soundid
				Sound.Volume = 10
				Sound:Play()
            end,
        },
		["soundlog"] = {
            ["ListName"] = "soundlog / slog",
            ["Description"] = "Logs all sound id's and their location, then dumps them into the console [F9].",
            ["Aliases"] = {'slog'},
            ["Function"] = function(args, speaker)
                for i,v in pairs(game:GetDescendants()) do
                    if v:IsA("Sound") then
                        local soundid = tostring(v.SoundId)
						warn("SoundHack - "..soundid.." / Found at the location: "..tostring(v:GetFullName()))
                    end
                end
                notify("SoundHack", "Finished logging sounds.")
            end,
        },
    },
}

return Plugin